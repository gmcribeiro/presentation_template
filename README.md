# Modifications

This template uses the beamer theme [moloch](https://github.com/jolars/moloch/) with some template overwrites:

 - Title page: Allows for a logo at the top and another logo at the bottom of the page;
 - Headline: Adds a headline displaying the current section current slide. This modification was made by [Bruno Silva](https://github.com/brunofavs/);
 - Frametitle: Allows for a logo on the right side of the frame's title centered with the text. Currently, it isn't fully automatic and needs adjustments depending on the size of the image.

# Usage

Clone the repository

```bash
git clone https://github.com/gmcribeiro/presentation_template
```

Go to the created directory

```bash
cd presentation_template
```

And then build with make

```bash
make
```


# Costumization

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

If you look into the source code of [custom_frametitle.tex](/template/custom_frametitle.tex), you will find the overwrite function ```\setbeamertemplate{frametitle}{(...)}```. The simplest approach to alignment is using ```columns```, but this environment does not work correctly inside ```beamercolorbox``` or ```tcolorbox``` when spanning the full ```\paperwidth```, causing misalignments.  

An alternative is the ```tabular``` environment with the ```m``` parameter for middle alignment. However, variable text length introduces alignment issues. Using ```minipage``` for each cell ensures text and image alignment, but the tabular environment cannot correctly determine boundaries, leading to text overflow outside the ```beamercolorbox```. Packages like ```adjustbox``` mitigate these issues, yet I encountered alignment problems and abandoned this approach.  

The only method that ensured proper alignment within ```beamercolorbox``` was using separate boxes for text and image, spacing them with ```hspace``` while avoiding line breaks between box definitions. This setup makes the boxes behave like inline text, aligning automatically. The other boxes around are for easily moving the text and the image as a single unit.


## To remove begin section page

Add

```latex
\AtBeginSection{}
```
