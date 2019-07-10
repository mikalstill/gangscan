#!/usr/bin/python

import csv
import os
import tempfile

from fpdf import FPDF

# We use HID Fargo Blank White PVC Plastic ID Cards model CR80. For the PDF,
# we are making portrait pages, which are 55mm by 86mm.
WIDTH = 55
HEIGHT = 86

# Logo size. The logo sits in a box with a 10mm margin to allow for lanyard
# slots. Logos are assumed to be square.
LOGO = 30

def makecards(cards):
    pdf = FPDF('P', 'mm', (WIDTH, HEIGHT))
    pdf.set_left_margin(3.0)
    pdf.set_right_margin(3.0)
    pdf.set_top_margin(3.0)

    # Load our font and then use it
    pdf.add_font('BebasNeue', 'B',
                 os.path.expanduser('~/gangserver-assets/BebasNeue.ttf'),
                 uni=True)

    pdf.set_auto_page_break(auto=False)

    for card in cards:
        pdf.add_page()

        # Logo
        pdf.set_y(10)
        pdf.image(os.path.expanduser('~/gangserver-assets/logo.png'),
                  w=LOGO, x=((WIDTH - LOGO)/2))

        # Name, in a bigger font
        pdf.set_font('BebasNeue', 'B', 20)
        pdf.set_y(LOGO + 15)

        if card['Preferred name'] != '':
            pdf.multi_cell(w=0, h=6, border=0, align='C',
                           txt=card['Preferred name'])
        else:
            pdf.multi_cell(w=0, h=6, border=0, align='C',
                           txt=card['Firstname'])

        pdf.set_y(LOGO + 23)
        pdf.multi_cell(w=0, h=6, border=0, align='C',
                       txt=card['Last name'])

        # Team, in a smaller font
        pdf.set_y(LOGO + 35)
        pdf.set_font('BebasNeue', 'B', 12)
        pdf.multi_cell(w=0, h=6, border=0, align='C', txt=card['Team'])

        # Icons
        if card['Health'] == 'Yes':
            pdf.image(
                os.path.expanduser('~/gangserver-assets/icon_medical.png'),
                w=8, x=(WIDTH-8)/2, y=75)

    handle, filename = tempfile.mkstemp(dir='gangserver/local',
                                        suffix='.pdf')
    os.close(handle)
    pdf.output(filename, 'F')
    return filename
