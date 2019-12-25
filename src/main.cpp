#include "board.h"
#include "signal.h"
#include "gui.h"
#include <math.h>
#include <fixed.h>

using hal::sys_tick;
using namespace board;
using namespace analog;
using namespace synth;
using namespace fixed;

typedef hal::timer::timer_t<2> dac_tim;

static volatile uint32_t dac_load = 0;

static const uint32_t SAMPLE_FREQ = 98380;  // adjusted for I2S prescale = 27 at 170MHz

static const float voct_volt_per_adc = 1. / 464.67;

static inline float adc2cv(uint16_t adc)
{
    return (2745.67 - static_cast<float>(adc)) * voct_volt_per_adc;
}

static inline float cv2midi(float x)
{
    return 60 + x * 12.;
}

static inline float midi2freq(float m)
{
    return 440 * pow(2., (m-69.) / 12.);
}

static inline float cv2freq(float cv)
{
    return 440. * pow(2., cv - 9. / 12.);
}

/*
static inline float volts(uint16_t x)
{
    return x / (2048. / 5.);    // FIXME: amp stage has wrong range!
}

static inline float cv2ratio(uint16_t x)
{
    return exp(x * (log(11.) / 4095.)) - 1.;
}

static inline float translate(uint16_t x, uint16_t x0, uint16_t x1, float y0, float y1)
{
    if (x < x0)
        return y0;
    if (x > x1)
        return y1;
    return y0 + (y1 - y0) * (x - x0) / static_cast<float>(x1 - x0);
}

static signal_generator_t<sine, SAMPLE_FREQ> modulator;
*/

class operator_t
{
public:
    void setup()
    {
        m_carrier.setup(220.);
        m_envelope.set_a(20e-3);
        m_envelope.set_d(0.5);
    }

    inline void control(float freq, float idx)
    {
        m_carrier.control(freq, idx);
    }

    __attribute__((always_inline))
    inline q31_t sample(q31_t mod = q31_t())
    {
        return response(m_envelope.sample()) * m_carrier.sample(mod);
    }

    __attribute__((always_inline))
    void trigger()
    {
        m_envelope.trigger();
    }

private:
    signal_generator_t<sine, SAMPLE_FREQ>   m_carrier;
    ad_envelope_t<SAMPLE_FREQ>              m_envelope;
};


static operator_t opa1, opa2;
static operator_t opb1, opb2;

/*

static volatile float freq = 440.;
static volatile float index = 0.5;
static volatile float ratio = 1.5;

void process_buffer(uint16_t *buf, uint16_t len)
{
    modulator.set_freq(freq * ratio);

    for (uint16_t i = 0; i < len; ++i)
    {
        carrier.set_freq(freq * (1 + index * modulator.sample()));
        buf[i] = (carrier.sample() + 1.01) * 2010.;     // FIXME: correct for clipping
    }
}

static const float rational[] =
    { 5.0e-2,5.263157894736842e-2,5.555555555555555e-2,5.8823529411764705e-2
    , 6.25e-2,6.666666666666667e-2,7.142857142857142e-2,7.692307692307693e-2
    , 8.333333333333333e-2,9.090909090909091e-2,0.1,0.10526315789473684
    , 0.1111111111111111,0.11764705882352941,0.125,0.13333333333333333
    , 0.14285714285714285,0.15,0.15384615384615385,0.15789473684210525
    , 0.16666666666666666,0.17647058823529413,0.18181818181818182,0.1875
    , 0.2,0.21052631578947367,0.21428571428571427,0.2222222222222222
    , 0.23076923076923078,0.23529411764705882,0.25,0.2631578947368421
    , 0.26666666666666666,0.2727272727272727,0.2777777777777778,0.2857142857142857
    , 0.29411764705882354,0.3,0.3076923076923077,0.3125
    , 0.3157894736842105,0.3333333333333333,0.35,0.35294117647058826
    , 0.35714285714285715,0.36363636363636365,0.3684210526315789,0.375
    , 0.38461538461538464,0.3888888888888889,0.4,0.4117647058823529
    , 0.4166666666666667,0.42105263157894735,0.42857142857142855,0.4375
    , 0.4444444444444444,0.45,0.45454545454545453,0.46153846153846156
    , 0.4666666666666667,0.47058823529411764,0.47368421052631576,0.5
    , 0.5263157894736842,0.5294117647058824,0.5333333333333333,0.5384615384615384
    , 0.5454545454545454,0.55,0.5555555555555556,0.5625
    , 0.5714285714285714,0.5789473684210527,0.5833333333333334,0.5882352941176471
    , 0.6,0.6111111111111112,0.6153846153846154,0.625
    , 0.631578947368421,0.6363636363636364,0.6428571428571429,0.6470588235294118
    , 0.65,0.6666666666666666,0.6842105263157895,0.6875
    , 0.6923076923076923,0.7,0.7058823529411765,0.7142857142857143
    , 0.7222222222222222,0.7272727272727273,0.7333333333333333,0.7368421052631579
    , 0.75,0.7647058823529411,0.7692307692307693,0.7777777777777778
    , 0.7857142857142857,0.7894736842105263,0.8,0.8125
    , 0.8181818181818182,0.8235294117647058,0.8333333333333334,0.8421052631578947
    , 0.8461538461538461,0.85,0.8571428571428571,0.8666666666666667
    , 0.875,0.8823529411764706,0.8888888888888888,0.8947368421052632
    , 0.9,0.9090909090909091,0.9166666666666666,0.9230769230769231
    , 0.9285714285714286,0.9333333333333333,0.9375,0.9411764705882353
    , 0.9444444444444444,0.9473684210526315,0.95,1.0
    , 1.0526315789473684,1.0555555555555556,1.0588235294117647,1.0625
    , 1.0666666666666667,1.0714285714285714,1.0769230769230769,1.0833333333333333
    , 1.0909090909090908,1.1,1.1111111111111112,1.1176470588235294
    , 1.125,1.1333333333333333,1.1428571428571428,1.1538461538461537
    , 1.1666666666666667,1.1764705882352942,1.1818181818181819,1.1875
    , 1.2,1.2142857142857142,1.2222222222222223,1.2307692307692308
    , 1.25,1.2666666666666666,1.2727272727272727,1.2857142857142858
    , 1.3,1.3076923076923077,1.3333333333333333,1.3571428571428572
    , 1.3636363636363635,1.375,1.3846153846153846,1.4
    , 1.4166666666666667,1.4285714285714286,1.4444444444444444,1.4545454545454546
    , 1.4615384615384615,1.5,1.5384615384615385,1.5454545454545454
    , 1.5555555555555556,1.5714285714285714,1.5833333333333333,1.6
    , 1.625,1.6363636363636365,1.6666666666666667,1.7
    , 1.7142857142857142,1.7272727272727273,1.75,1.7777777777777777
    , 1.8,1.8181818181818181,1.8333333333333333,1.8571428571428572
    , 1.875,1.8888888888888888,1.9,2.0
    , 2.111111111111111,2.125,2.142857142857143,2.1666666666666665
    , 2.2,2.2222222222222223,2.25,2.2857142857142856
    , 2.3333333333333335,2.375,2.4,2.4285714285714284
    , 2.5,2.5714285714285716,2.6,2.6666666666666665
    , 2.7142857142857144,2.75,2.8,2.8333333333333335
    , 2.857142857142857,3.0,3.1666666666666665,3.2
    , 3.25,3.3333333333333335,3.4,3.5
    , 3.6,3.6666666666666665,3.75,3.8
    , 4.0,4.25,4.333333333333333,4.5
    , 4.666666666666667,4.75,5.0,5.333333333333333
    , 5.5,5.666666666666667,6.0,6.333333333333333
    , 6.5,6.666666666666667,7.0,7.5
    , 8.0,8.5,9.0,9.5
    , 10.0,11.0,12.0,13.0
    , 14.0,15.0,16.0,17.0
    , 18.0,19.0,20.0
    };

static const uint8_t rational_size = sizeof(rational) / sizeof(*rational);

template<typename T, typename U>
static void bounded_add(T& x, U y, T lb, T ub)
{
    T z = x + y;

    if (z >= lb && z <= ub)
        x = z;
}

enum focus_t { focus_freq, focus_ratio, focus_end };

*/

template<> void handler<interrupt::EXTI15_10>()
{
    bool ba = triga::interrupt_pending();
    bool bb = trigb::interrupt_pending();

    if (ba)
    {
        opa1.trigger();
        opa2.trigger();
        led1::toggle();
    }

    if (bb)
    {
        opb1.trigger();
        opb2.trigger();
        led2::toggle();
    }

    if (ba)
        triga::clear_interrupt();
    if (bb)
        trigb::clear_interrupt();
}

static void fa(int32_t *buf, uint16_t n, uint8_t stride)
{
    float f = cv2freq(adc2cv(reada<0>()));

    opa1.control(f, 3.0f);
    opa2.control(f * 2.0f, 0.0f);
    for (uint16_t i = 0; i < n; ++i, buf += stride)
        *buf = board::dacdma::swap(opa1.sample(opa2.sample()).q);
}

static void fb(int32_t *buf, uint16_t n, uint8_t stride)
{
    float f = cv2freq(adc2cv(readb<0>()));

    opb1.control(f, 3.0f);
    opb2.control(f * 5.0f, 0.0f);
    for (uint16_t i = 0; i < n; ++i, buf += stride)
        *buf = board::dacdma::swap(opb1.sample(opb2.sample()).q);
}

template<> void handler<interrupt::DMA2_CH1>()
{
    uint32_t total_count = dac_tim::count();

    dac_tim::set_count(0);
    board::dacdma::handle_interrupt();

    if (total_count > 0)
        dac_load = (100 * dac_tim::count()) / total_count;
}

int main()
{
    static gui_t<board::tft> gui;

    dac_tim::setup(170, 0xffff);

    board::dacdma::set_left_gen(fa);
    board::dacdma::set_right_gen(fb);

    board::setup();
    sys_tick::delay_ms(1000);

    triga::enable_interrupt<falling_edge>();
    trigb::enable_interrupt<falling_edge>();
    hal::nvic<interrupt::EXTI15_10>::enable();
    hal::nvic<interrupt::DMA2_CH1>::enable();

    gui.setup();
    gui.render();

    setup_cordic();
    opa1.setup();
    opa2.setup();
    opb1.setup();
    opb2.setup();

    for (;;)
    {
        message_t m;

        if (mq::get(m))
            gui.handle_message(m);

        gui.channel_a.freq = cv2freq(adc2cv(reada<0>()));
        gui.channel_a.note = gui.channel_a.freq;
        gui.channel_a.cv1 = reada<1>();
        gui.channel_a.cv2 = reada<2>();
        gui.channel_a.cv3 = reada<3>();

        gui.channel_b.freq = cv2freq(adc2cv(readb<0>()));
        gui.channel_b.note = gui.channel_b.freq;
        gui.channel_b.cv1 = readb<1>();
        gui.channel_b.cv2 = readb<2>();
        gui.channel_b.cv3 = readb<3>();
 
        //gui.cv4b = dac_load;

        sys_tick::delay_ms(1);
    }

    /*
    setup_cordic();
    modulator.setup(440);
    carrier.setup(440);
    output::setup();

    focus_t focus = focus_freq;
    static uint8_t midi = 0;
    uint8_t ridx = 0;

    for (;;)
    {
        message_t m;

        if (mq::get(m))
        {
            switch (m.index())
            {
            case button_press:
                printf("button %d\n", std::get<button_press>(m));
                if (std::get<button_press>(m) == 0)
                {
                    focus = static_cast<focus_t>(static_cast<int>(focus) + 1);
                    if (focus == focus_end)
                        focus = static_cast<focus_t>(0);
                }
                break;
            case encoder_delta:
                printf("encoder %d\n", std::get<encoder_delta>(m));
                switch (focus)
                {
                case focus_freq:
                    bounded_add<uint8_t, int16_t>(midi, std::get<encoder_delta>(m), 0, 108);
                    printf("midi %d, f = %6.2f\n", midi, freq);
                    break;
                case focus_ratio:
                    bounded_add<uint8_t, int16_t>(ridx, std::get<encoder_delta>(m), 0, rational_size - 1);
                    ratio = rational[ridx];
                    break;
                default: printf("wrong focus\n");
                }
                break;
            default:
                printf("unhandled message type\n");
            }
        }

        index = translate(read<1>(), 190, 2100, 1., .0) * translate(read<2>(), 20, 4095, .0, 50.);

        float voct = volts(read<0>()) - 5.;

        freq = midi2freq(midi + trunc(cv2midi(voct)));

        printf("%5d %5d %5d %d %7.4f\n", read<0>(), read<1>(), read<2>(), midi, freq);
        sys_tick::delay_ms(20);
    }
    */
}

namespace std
{

void __throw_bad_function_call() { while(1); }

} // namespace std


