#!/usr/bin/python

import csv

from fpdf import FPDF

# We use HID Fargo Blank White PVC Plastic ID Cards model CR80. For the PDF,
# we are making portrait pages, which are 55mm by 86mm.
pdf = FPDF('P', 'mm', (55, 86))
pdf.set_left_margin(3.0)
pdf.set_right_margin(3.0)
pdf.set_top_margin(3.0)
pdf.set_font('Arial', 'B', 12)
pdf.set_auto_page_break(auto=False)

with open('db.csv') as f:
    reader = csv.DictReader(f)
    print('We have these fields: %s' % reader.fieldnames)
    for row in reader:
        pdf.add_page()

        # Logo and text
        pdf.set_y(3)
        pdf.image('logo.jpg', w=49, x=3)

        pdf.set_y(55)
        pdf.multi_cell(w=0, h=6, border=0, align='C',
                       txt='%s\n%s' %(row['Name'], row['Team']))

        # Icons
        if row['Health'] == 'Yes':
            pdf.image('icon_medical.png', w=8, x=(55-8)/2, y=75)

        print('... %s' % row['Name'])

pdf.output('badges.pdf', 'F')
print('Done')
