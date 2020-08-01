#pragma once

#include "signal.h"
#include <list.h>

template<ch_t CH, typename DISPLAY>
struct calib_t: window_t<DISPLAY>, imodel
{
    enum state_t { start, counting, finish };
    const int nsamples = 5;

    calib_t(const theme_t& t)
        : m_count(t, 0)
        , m_freq0(t, 0.0)
        , m_freq1(t, 0.0)
        , m_panel(&m_count, &m_freq0, &m_freq1)
        , m_visible(false)
    {
        list<ifocus*> navigation;

        window_t<DISPLAY>::setup(&m_panel, navigation, t);
        reset();
    }

    virtual void render()
    {
        reset();
        m_visible = true;
        window_t<DISPLAY>::render();
    }

    virtual action_t handle_message(const message_t& m)
    {
        switch (m.index())
        {
        case aux_data:
            if (m_count & 0x1)
                m_freq0 = m_odd / nsamples;
            else
                m_freq1 = m_even / nsamples;
            if (m_count == nsamples * 2)
                m_state = finish;
            else
                m_count = m_count + 1;
            return action<no_action>(unit);
        case button_press:
            switch (std::get<button_press>(m))
            {
            case 0:
                m_visible = false;
                return (CH == A) ? action<pop_window>(0)
                                 : action<pop_window_message>(m)
                                 ;
            case 1:
                m_state = counting;
                return action<no_action>(unit);
            case 2:
                m_visible = false;
                return (CH == B) ? action<pop_window>(0)
                                 : action<pop_window_message>(m)
                                 ;
            default:
                return action<no_action>(unit);
            }
        default:
            return window_t<DISPLAY>::handle_message(m);
        }
    }

    // imodel

    virtual void generate(ctrl_t& ctx, int32_t *, uint16_t, uint8_t)
    {
        if (m_capture && hal::sys_tick::count() > m_now + 20)
        {
            ((m_count & 0x1) ? m_odd : m_even) += ctx.freq;
            m_capture = false;
        }
    }

    virtual void trigger(bool rise)
    {
        if (rise && m_state == counting)
        {
            m_now = hal::sys_tick::count();
            m_capture = true;
            board::mq::put(message_t().emplace<aux_data>(0));
        }
    }

    void reset()
    {
        m_state = start;
        m_count = 0;
        m_freq0 = m_freq1 = 0.0;
        m_odd = m_even = 0.0;
        m_capture = false;
        m_now = 0;
    }

    using intbox = valuebox_t<DISPLAY, show_int>;
    using freqbox = valuebox_t<DISPLAY, show_float<4>>;

    intbox              m_count;
    freqbox             m_freq0;
    freqbox             m_freq1;
    vertical_t<DISPLAY> m_panel;
    bool                m_visible;
    state_t             m_state;
    float               m_odd;
    float               m_even;
    volatile bool       m_capture;
    volatile uint32_t   m_now;
};
