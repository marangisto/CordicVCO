#pragma once

#include <list.h>
#include "utils.h"
#include "freqmod.h"

template<typename DISPLAY>
struct channel_t: public imodel
{
    typedef valuebox_t<DISPLAY, show_str> label;
    typedef valuebox_t<DISPLAY, show_note> notebox;
    typedef valuebox_t<DISPLAY, show_prog, edit_prog> progbox;
    typedef valuebox_t<DISPLAY, show_int, edit_int> intbox;
    typedef valuebox_t<DISPLAY, show_float<3>, edit_float<1000> > floatbox;
    typedef valuebox_t<DISPLAY, show_scale, edit_scale> scalebox;

    void setup(const bool *quiet)
    {
        //const fontlib::font_t& font = fontlib::cmunbi_28.cpp
        //const fontlib::font_t& font = fontlib::cmunbtl_28;
        //const fontlib::font_t& font = fontlib::cmunbto_28;
        //const fontlib::font_t& font = fontlib::cmunbx_28;
        //const fontlib::font_t& font = fontlib::cmunit_28;
        //const fontlib::font_t& font = fontlib::cmunrm_28;
        //const fontlib::font_t& font = fontlib::cmunsi_28;
        //const fontlib::font_t& font = fontlib::cmunso_28;
        //const fontlib::font_t& font = fontlib::cmunss_28;
        //const fontlib::font_t& font = fontlib::cmunssdc_28;
        //const fontlib::font_t& font = fontlib::cmunsx_28;
        //const fontlib::font_t& font = fontlib::cmuntb_28;
        //const fontlib::font_t& font = fontlib::cmunti_28;
        //const fontlib::font_t& font = fontlib::cmuntt_28;
        //const fontlib::font_t& font = fontlib::cmuntx_28;
        //const fontlib::font_t& font = fontlib::cmunvi_28;
        const fontlib::font_t& font = fontlib::cmunvt_28;
        const fontlib::font_t& large = fontlib::cmunssdc_32;

        m_note.setup(large, dark_fg, dark_bg, 440.0f, quiet);
        m_freq.setup(font, alternate_fg, alternate_bg, 440.000f, quiet);
        m_cv1.setup(font, alternate_fg, alternate_bg, 0, quiet);
        m_cv2.setup(font, alternate_fg, alternate_bg, 0, quiet);
        m_cv3.setup(font, alternate_fg, alternate_bg, 0, quiet);
        m_prog.setup(font, normal_fg, normal_bg, pg_freqmod);
        m_scale.setup(font, normal_fg, normal_bg, chromatic);
        m_transpose.setup(font, normal_fg, normal_bg, 0);
        m_tuning.setup(font, normal_fg, normal_bg, 0.0f);
        m_column.setup();
        m_column.append(&m_note);
        m_column.append(&m_freq);
        m_column.append(&m_cv1);
        m_column.append(&m_cv2);
        m_column.append(&m_cv3);
        m_column.append(&m_prog);
        m_column.append(&m_scale);
        m_column.append(&m_transpose);
        m_column.append(&m_tuning);
        m_frame.setup(&m_column, dim_gray);
        m_voct.setup(m_tuning.ptr(), m_transpose.ptr(), m_scale.ptr());
        m_model = &m_freqmod;
        m_freqmod.setup();
    }

    void render()
    {
        m_frame.render();
    }

    void prog_render()
    {
        switch (m_prog)
        {
            case pg_freqmod: m_freqmod.render(); break;
            default: ;
        }
    }

    bool prog_handle_message(const message_t& m)
    {
        switch (m_prog)
        {
            case pg_freqmod: return m_freqmod.handle_message(m);
            default: return false;
        }
    }

    list<ifocus*> navigation()
    {
        list<ifocus*> l;

        l.push_back(&m_prog);
        l.push_back(&m_scale);
        l.push_back(&m_transpose);
        l.push_back(&m_tuning);
        return l;
    }

    // imodel

    virtual void generate(ctrl_t& ctrl, int32_t *buf, uint16_t n, uint8_t stride)
    {
        ctrl.freq = m_voct.freq(ctrl.freq);
        m_model->generate(ctrl, buf, n, stride);
    }

    virtual void trigger(bool rise)
    {
        m_model->trigger(rise);
    }

    notebox                 m_note;
    floatbox                m_freq;
    intbox                  m_cv1, m_cv2, m_cv3;
    progbox                 m_prog;
    scalebox                m_scale;
    intbox                  m_transpose;
    floatbox                m_tuning;
    vertical_t<DISPLAY>     m_column;
    border_t<DISPLAY>       m_frame;
    voct_t                  m_voct;
    imodel                  *m_model;
    freqmod_t<DISPLAY>      m_freqmod;
};

template<typename DISPLAY>
struct gui_t
{
    typedef valuebox_t<DISPLAY, show_percent<1> > pctbox;
    enum state_t { navigating, editing, prog_a, prog_b };

    void setup()
    {
        const fontlib::font_t& font = fontlib::cmunvt_28;

        channel_a.setup(&quiet);
        channel_b.setup(&quiet);
        load.setup(font, gold, dark_bg, 0.0f, &quiet);
        inner.setup();
        inner.append(&channel_a.m_frame);
        inner.append(&channel_b.m_frame);
        panel.setup();
        panel.append(&inner);
        panel.append(&load);
        panel.constrain(10, 240, 10, 480); // FIXME: LAYOUT HACK! & what about zero min?
        panel.layout(0, 0);
        navigation = channel_a.navigation();
        navigation.splice(navigation.end(), channel_b.navigation());
        focus = navigation.begin();
        (*focus)->focus(normal_cursor);
        quiet = false;
    }

    void render()
    {
        DISPLAY::clear();
        switch (state)
        {
            case prog_a: quiet = true; channel_a.prog_render(); break;
            case prog_b: quiet = true; channel_b.prog_render(); break;
            default: quiet = false; panel.render();
        }
    }

    void handle_message(const message_t& m)
    {
        switch (state)
        {
            case prog_a:
                if (!channel_a.prog_handle_message(m))
                {
                    state = navigating;
                    quiet = false;
                    panel.render();
                }
                return;
            case prog_b:
                if (!channel_b.prog_handle_message(m))
                {
                    state = navigating;
                    quiet = false;
                    panel.render();
                }
                return;
            default: ;
        }

        switch (m.index())
        {
        case button_press:
            switch (std::get<button_press>(m))
            {
            case 0: // encoder button
                state = state == navigating ? editing : navigating;
                (*focus)->focus(state == editing ? active_cursor : normal_cursor);
                break;
            case 1: // top-left
                state = prog_a;
                render();
                break;
            case 2: // bottom-left
                break;
            case 3: // top-right
                state = prog_b;
                render();
                break;
            case 4: // bottom-right
                break;
            default: ;  // unhandled button
            }
            break;
        case encoder_delta:
            if (state == navigating)
            {
                int dir = std::get<encoder_delta>(m);

                (*focus)->defocus();
                if (dir > 0 && ++focus == navigation.end())
                    focus = navigation.begin();
                else if (dir < 0 && --focus == navigation.end())
                    --focus;
                (*focus)->focus(normal_cursor);
            }
            else
                (*focus)->edit(std::get<encoder_delta>(m));
            break;
        default: ;      // unhandled message
        }
    }

    channel_t<DISPLAY>      channel_a, channel_b;
    pctbox                  load;
    horizontal_t<DISPLAY>   inner;
    vertical_t<DISPLAY>     panel;
    list<ifocus*>           navigation;
    list_iterator<ifocus*>  focus;
    state_t                 state;
    bool                    quiet;
};

