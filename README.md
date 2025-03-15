# Modifications

This template uses the beamer theme [moloch](https://github.com/jolars/moloch/) with some template overwrites:

 - Title page: Allows for a logo at the top and another logo at the bottom of the page;
 - Headline: Adds a headline displaying the current section current slide. This modification was made by [Bruno Silva](https://github.com/brunofavs/);
 - Frametitle: Allows for a logo on the right side of the frame's title centered with the text. Currently, it isn't fully automatic and needs adjustments depending on the size of the image.

# Usage

The modifications are in the file [template/template_configs.tex](/template/template_configs.tex). Each modification has its command, which can be disabled by commenting the command's line.

## Title page

### Top logo

```latex
\titlegraphic{\hfill\includegraphics[height=1cm]{template/combined_logo_mDarkTeal.eps}}
```

Change the logo by changing ```\includegraphics[height=1cm]{template/combined_logo_mDarkTeal.eps}``` and you can reposition the logo to the center by replacing ```\hfill``` with ```\contering``` or at the right by removing ```\hfill```.

### Bottom logo

```latex
\titlegraphicfoot{\centering\includegraphics[height=0.8cm]{template/prr_logo.eps}}
```

## Headline

To add the headline use

```latex
\headline
```

And to remove comment it out.

## Frame title logo

To add a logo to the frame tile, here is an example:

```latex
\frametitletable{\includegraphics[height=3.8ex,keepaspectratio]{template/ua_logo_white.eps}}{0.82}{5pt}{3pt}{-3pt}
```
This command has five parameters:

```latex
\frametitletable{#1}{#2}{#3}{#4}{#5}
```

 - #1 is the command to add the image (leave blank for none);
 - #2 is the space share for the text (between 0 and 1) - This can be automated based on the image width, and I will probably do it in the future;
 - #3 is the margin of the colored box around the frame title content;
 - #4 is the space between the text and the beginning of the image
 - #5 is a compensation to the title offset due to the way the modification was implemented

### The problems of implementation

(to be done)


## To remove begin section page

Add

```latex
\AtBeginSection{}
```
