%
%  Copyright 2018 Wen Wang <wwzvd@mst.edu>
%
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license or (at your option) any later version.
%  The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
%  and version 1.3 or later is part of all distributions of LaTeX
%  version 2005/12/01 or later.
%
%  This work has the LPPL maintenance status `maintained'.
%
%  The Current Maintainer of this work is Wen Wang <wwzvd@mst.edu>.
%
%  This work consists of the files thesis-uestc.cls, thesis-uestc.bst.
%


\ProvidesClass{thesis-uestc}

\LoadClass[12pt, openany, twoside]{book}

\RequirePackage{ifxetex}
\RequireXeTeX

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[font={doublespacing, small}, labelsep=space, skip=6pt]{caption}

\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{multirow}
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{lmodern}
\RequirePackage{mathspec}
\RequirePackage{fontspec}
\RequirePackage{bm}

\RequirePackage{xeCJK}
\RequirePackage{ifplatform}

\ifwindows
  \setallmainfonts{Times New Roman}
  \setCJKmainfont[AutoFakeBold=true]{SimSun}
  \newCJKfontfamily{\heiti}{SimHei}
\else
\ifmacosx
  \setallmainfonts{Times New Roman}
  \setCJKmainfont[AutoFakeBold=true]{Songti SC}
  \newCJKfontfamily{\heiti}{STHeiti}
\else
  \setCJKmainfont[AutoFakeBold=true]{simsun.ttc}
  \newCJKfontfamily{\heiti}{simhei.ttf}
  \setallmainfonts[
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf,
  ]{times.ttf}
\fi
\fi

\RequirePackage{zhnumber}
\RequirePackage{pifont}

\RequirePackage[hyphens]{url}
\RequirePackage[hyperfootnotes=false,
    bookmarksnumbered,
    bookmarksdepth=4
]{hyperref}
\hypersetup{
  colorlinks=true,
  citecolor=black,
  linkcolor=black,
  urlcolor=black
}

\makeatletter % undo the wrong changes made by mathspec
\let\RequirePackage\original@RequirePackage
\let\usepackage\RequirePackage
\makeatother
\RequirePackage[nopostdot]{glossaries}
\renewcommand*{\glossarypreamble}{\vspace{-9pt}}

\newacronymstyle{acronym-uestc}{
  \ifglshaslong{\glslabel}{\glsgenacfmt}{\glsgenentryfmt}
}{
  \renewcommand*{\GenericAcronymFields}{
    first={\the\glslongtok\space\protect\paren{\the\glsshorttok}},
    description={\the\glslongtok}}
  \renewcommand*{\genacrfullformat}[2]{%
    \glsentrydesc{##1}~(\glsentrylong{##1},\space%
    \glsentryshort{##1})%
  }
  \renewcommand*{\acronymentry}[1]{%
    \acronymfont{\glsentryshort{##1}}%
  }
}
\setacronymstyle{acronym-uestc}

\newglossarystyle{long-uestc}{
  \renewenvironment{theglossary}%
    {\begin{longtable}{lp{.7\textwidth}}}%
    {\end{longtable}}%

  \renewcommand*{\glossaryheader}{}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \ifglshaslong{##1}{\glsentrylong{##1}\ifglshasdesc{##1}{, \glsentrydesc{##1}}{}}
    {\glsentrydesc{##1}} \\
  }
  \renewcommand*{\subglossentry}[3]{
  \glossentry{##2}{##3}}
}

\defglsentryfmt{%
  \ifglshaslong{\glslabel}{%
    \glsgenacfmt%
  }{%
    \ifglsused{\glslabel}{%
      \glsgenentryfmt%
    }{%
      \glsgenentryfmt%
    }%
  }%
}

\newcommand{\thesisglossarylist}{
  \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont Glossary}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \setlength\glsdescwidth{.7\textwidth}
  \pdfbookmark{缩略词表}{glossary}
  \printglossary[style=long-uestc, title={\protect\centering 缩略词表}, nonumberlist, nogroupskip]
}
\makeglossaries

\RequirePackage{standalone}
\RequirePackage{indentfirst}
\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{cite}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}
\RequirePackage{algorithm2e}
\RequirePackage{etoolbox}
\RequirePackage{newfloat}
\RequirePackage[resetlabels]{multibib}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{everypage}
\RequirePackage{ifoddpage}


\let\algorithm\relax
\let\endalgorithm\relax
\expandafter\let\csname algorithm*\endcsname\relax
\expandafter\let\csname endalgorithm*\endcsname\relax
\let\listofalgorithms\relax

% Define the new algorithm environment
\DeclareFloatingEnvironment{algorithm}

\makeatletter
\renewcommand{\@endalgoln}{\@endalgocfline\hfill\strut\par}
\renewcommand{\;}{\ifmmode
  \@mathsemicolon
\else
  \@endalgoln
\fi
}
% Definition for the style ruled
% First add the rules enclosing the captiom
\DeclareCaptionFormat{algrule}{%
  {\@hangfrom{#1#2}%
     \doublespacing
     \small
     \advance\caption@parindent\hangindent
     \advance\caption@hangindent\hangindent
     \caption@@par#3\par}%
}

% Apply the new format to the algorithm environment
\captionsetup[algorithm]{format=algrule}

\makeatletter

\renewcommand{\algorithmname}{Algorithm}
\renewcommand{\thealgorithm}{\arabic{chapter}-\arabic{algorithm} \hspace{4pt}}
\captionsetup[algorithm]{aboveskip=6pt}
\AtBeginEnvironment{algorithm}{\vspace{6pt}}

\graphicspath{{./pic/}}

\RequirePackage[titles, subfigure]{tocloft}
\RequirePackage{subfigure}


\urlstyle{rm}
\raggedbottom

\renewcommand{\contentsname}{Contents}
\renewcommand{\bibname}{References}
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}

%\renewcommand{\cftchapnumwidth}{100pt}

%\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
%\addtocontents{lof}{\protect\noaddvspace}
% \addtocontents{lot}{\protect\noaddvspace}


\pretocmd{\listoffigures}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont List of Figures}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \renewcommand{\cftfigpresnum}{Figure}
  \addtolength{\cftfignumwidth}{28pt}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

\newcommand{\thesisfigurelist}{
  \listoffigures
}

\pretocmd{\listoftables}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont List of Tables}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \renewcommand{\cfttabpresnum}{Table}
  \addtolength{\cfttabnumwidth}{28pt}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

\newcommand{\thesistablelist}{
  \listoftables
}

\RequirePackage[a4paper,
  inner=3cm, outer=3cm, top=3cm, bottom=3cm,
  bindingoffset=0cm]{geometry}

\setlength{\headheight}{15pt}

\pagestyle{fancy}
\linespread{1.391}
\setlength\parindent{24pt}
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\renewcommand\thechapter{\bf Chapter \arabic{chapter}}

%%% my edits of the toc, lof / lot
%\renewcommand{\cftchapnumwidth}{3}
%\renewcommand{\cftfignumwidth}{1cm}
%\renewcommand{\cfttabnumwidth}{1cm}


\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\captionsetup{format=hang}
\captionsetup{width=\textwidth - 42pt}
\captionsetup[figure]{aboveskip=6pt,belowskip=0pt}
\captionsetup[table]{belowskip=6pt}
\setlength{\extrarowheight}{5pt}
\setlength{\subfigcapskip}{0pt}
\setlength{\intextsep}{9pt}

\makeatletter
\AtBeginEnvironment{figure}{
  \def\@floatboxreset{\centering}
}
\makeatother

\makeatletter
\AtBeginEnvironment{table}{
  \def\@floatboxreset{\centering}
}
\makeatother
\AtBeginEnvironment{tabular}{\small}

\makeatletter
\renewcommand{\p@subfigure}{\arabic{chapter}-\arabic{figure}}
\makeatother

\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}
\newcommand{\chineseperiod}{\char"3002}
\newcommand{\chinesequestion}{\char"FF1F}
\newcommand{\chineseexclamation}{\char"FF01}
\newcommand{\chinesecomma}{\char"FF0C}
\newcommand{\chinesesemicolon}{\char"FF1B}
\newcommand{\chineseleftparenthesis}{\char"FF08}
\newcommand{\chineserightparenthesis}{\char"FF09}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

\titleformat{\chapter}[block]
  {\bf\centering\fontsize{15pt}{15pt}\selectfont\heiti\thispagestyle{fancy}}{\thechapter}{7.5pt}{}

\titleformat{\section}[block]
  {\fontsize{14pt}{14pt}\selectfont\heiti}
  {\thesection}{7pt}{}

\titleformat{\subsection}[block]
  {\fontsize{14pt}{14pt}\selectfont\heiti}
  {\thesubsection}{7pt}{}

\titleformat{\subsubsection}[block]
  {\fontsize{12pt}{12pt}\selectfont\heiti}
  {\thesubsubsection}{6pt}{}

\RequirePackage[hang, perpage]{footmisc}
\addtolength{\footnotesep}{0pt}
\setlength{\footnotemargin}{13.5pt}

\renewcommand{\footnotesize}{\fontsize{9pt}{10.8pt}\selectfont}
\renewcommand{\small}{\fontsize{10.5pt}{12.6pt}\selectfont}
\renewcommand\footnotelayout{\fontsize{9}{11.7}\selectfont}

\renewcommand{\thefootnote}{\ifcase\value{footnote}\or\ding{172}\or
\ding{173}\or\ding{174}\or\ding{175}\or\ding{176}\or\ding{177}\or
\ding{178}\or\ding{179}\or\ding{180\or\ding{181}}\fi}

\renewcommand{\footnoterule}{\vfill\noindent\vspace{0.9mm}\hspace{27pt}\rule{5.05cm}{0.02cm}\vspace*{2.6pt}}

\makeatletter
\def\@makefntext #1{
  \ifFN@hangfoot
      \bgroup \setbox \@tempboxa \hbox {
          \ifdim
        \footnotemargin >0pt \hb@xt@
                \footnotemargin {\hbox { \normalfont \@thefnmark}\hss }
            \else
              \hbox { \normalfont \@thefnmark}
      \fi
    }
        \leftmargin \wd \@tempboxa
        \rightmargin \z@ \linewidth \columnwidth
          \advance \linewidth -\leftmargin\parshape \@ne
    \leftmargin \linewidth \footnotesize \@setpar {{\@@par }}
    \leavevmode \llap {\box \@tempboxa }\parskip
        \hangfootparskip \relax \parindent
    \hangfootparindent \relax
        \else
          \parindent 1em \noindent
            \ifdim
                \footnotemargin >\z@ \hb@xt@
                \footnotemargin {\hss \hbox { \normalfont \@thefnmark} }
            \else
        \ifdim \footnotemargin =\z@
                    \llap {\hbox { \normalfont \@thefnmark} }
                \else
          \llap {\hb@xt@ -\footnotemargin {\hbox { \normalfont \@thefnmark} \hss }}
        \fi
            \fi
    \fi
        \footnotelayout #1\ifFN@hangfoot \par \egroup
  \fi
}
\makeatother

\newcounter{pseudopage}
\setcounter{pseudopage}{0}
\AddEverypageHook{\stepcounter{pseudopage}}

\newcommand\blankpage{%
  \newpage
  \null
  \thispagestyle{empty}%
  \addtocounter{pseudopage}{-1}%
  \newpage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{chineseabstract}{
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \pagenumbering{Roman}
    \pdfbookmark{中文摘要}{chineseabstract}
    \chapter*{摘\chinesespace 要}
    \thispagestyle{fancy}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 摘要}
}
%\newpage
%{
 % \checkoddpage
  %\ifoddpage
   %   \blankpage
    %\else
     % \newpage
    %\fi
%}

\newcommand{\chinesekeyword}[1]{
  \vspace{\baselineskip}
  \noindent
    \begin{minipage}[t]{48pt}
      \noindent\textbf{关键词\chinesecolon}
    \end{minipage}
    \begin{minipage}[t]{\linewidth - 48pt}
      #1
    \end{minipage}
}
\newpage

\newenvironment{englishabstract}{
  \pdfbookmark{英文摘要}{englishabstract}
  \chapter*{\bfseries ABSTRACT}
    \thispagestyle{fancy}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont ABSTRACT}
}
%{
  %\checkoddpage
  %\ifoddpage
   %   \blankpage
    %\else
     % \newpage
    %\fi
%}

\newcommand{\englishkeyword}[1]{
  \vspace{\baselineskip}
  \noindent\begin{minipage}[t]{2.1cm}
      \noindent\textbf{Keywords:}
    \end{minipage}
    \begin{minipage}[t]{
      \linewidth - 2.1cm}
        #1
    \end{minipage}
}
\newpage
\AddEverypageHook{\addtocontents{toc}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lof}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lot}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\tocloftpagestyle{fancy}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{0.4}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}
\setlength{\cftbeforechapskip}{0pt}

\addtocontents{toc}{\protect\setlength{\cftchapnumwidth}{20mm}}
%\addtolength{\protect\cftchapnumwidth}{32pt}



\cftsetindents{section}{21pt}{22pt}
\cftsetindents{subsection}{44pt}{31pt}
\cftsetindents{subsubsection}{76pt}{41pt}

\renewcommand{\cfttoctitlefont}{\fontsize{15pt}{15pt}\selectfont\heiti}
\renewcommand\cftchapfont{\bf\heiti} % King added bf to make the Chapter title bold

\newcommand{\chinesedegreename}{硕士}
\newcommand{\englishdegreename}{Master}
\newcommand{\chinesebooktitle}{硕士学位论文}
\newcommand{\englishbooktitle}{Master Thesis}
\newcommand{\thetitle}{}
\newcommand{\thetitleEn}{}
\newcommand{\theauthor}{}
\newcommand{\theauthorEn}{}
\newcommand{\thedate}{}
\newcommand{\theschool}{}
\newcommand{\themajor}{}
\newcommand{\themajorEn}{}
\newcommand{\theadvisor}{}
\newcommand{\theadvisorEn}{}
\newcommand{\thestudentid}{}


\renewcommand{\title}[1]{
  \renewcommand{\thetitle}{#1}
}

\newcommand{\titleEn}[1]{
	\renewcommand{\thetitleEn}{#1}
}

\renewcommand{\author}[1]{
  \renewcommand{\theauthor}{#1}
}

\newcommand{\authorEn}[1]{
  \renewcommand{\theauthorEn}{#1}
}

\renewcommand{\date}[1]{
  \renewcommand{\thedate}{#1}
}

\newcommand{\major}[1]{
  \renewcommand{\themajor}{#1}
}

\newcommand{\majorEn}[1]{
	\renewcommand{\themajorEn}{#1}
}

\newcommand{\school}[1]{
  \renewcommand{\theschool}{#1}
}

\newcommand{\advisor}[1]{
  \renewcommand{\theadvisor}{#1}
}

\newcommand{\advisorEn}[1]{
	\renewcommand{\theadvisorEn}{#1}
}

\newcommand{\studentid}[1]{
  \renewcommand{\thestudentid}{#1}
}



\DeclareOption{master}{
  \renewcommand{\chinesedegreename}{硕士}
  \renewcommand{\englishdegreename}{Master}
  \renewcommand{\chinesebooktitle}{硕士学位论文}
  \renewcommand{\englishbooktitle}{Master Thesis}
}

\DeclareOption{promaster}{
  \renewcommand{\chinesedegreename}{硕士}
  \renewcommand{\englishdegreename}{Master}
  \renewcommand{\chinesebooktitle}{专业学位硕士学位论文}
  \renewcommand{\englishbooktitle}{Master Thesis for Professional Degree}
}

\DeclareOption{doctor}{
  \renewcommand{\chinesedegreename}{博士}
  \renewcommand{\englishdegreename}{Doctoral}
  \renewcommand{\chinesebooktitle}{博士学位论文}
  \renewcommand{\englishbooktitle}{Doctoral Dissertation}
}


\newcommand{\makecover}{
\thispagestyle{empty}
\setlength{\extrarowheight}{9pt}
\begin{center}
  \fontsize{22pt}{22pt}\selectfont 电子科技大学 \\[7bp]
  \fontsize{12pt}{12pt}\selectfont UNIVERSITY OF ELECTRONIC SCIENCE
    AND TECHNOLOGY OF CHINA \\[36bp]
  \fontsize{42pt}{42pt}\selectfont\chinesebooktitle \\[24bp]
  \fontsize{16pt}{16pt}\selectfont
  \MakeUppercase{\englishbooktitle} \\[36bp]
  \includegraphics[width=221bp]{logo.pdf} \\[36bp]
  \begin{tabular}{lp{4.6in}}
    \fontsize{18pt}{16pt}\selectfont {\heiti 论文题目} & \multirow[t]{2}{4.6in}{
        \centering
          \fontsize{16pt}{19pt}\selectfont
          \heiti{\thetitle}
    } \\
    \cline{2-2}
            & \\
    \cline{2-2}        
            & \\
    \cline{2-2}
  \end{tabular} \\[\baselineskip]
  \begin{tabular}{>{\fontsize{16pt}{16pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{3.77in}}
    {\heiti 学~科~专~业} & {\heiti\themajor} \\
    \cline{2-2}
    {\heiti 学\chinesespace\chinesespace ~~ 号} & {\thestudentid} \\
    \cline{2-2}
    {\heiti 作~者~姓~名} & {\heiti\theauthor} \\
    \cline{2-2}
    {\heiti 指~导~教~师} & {\heiti\theadvisor} \\
    \cline{2-2}
    
  \end{tabular}
\end{center}

%\blankpage
\newpage
\thispagestyle{empty}  

\noindent
分类号 \uline{\hspace{2.5in}} 密级 \uline{\hspace{2.5in}} \\[12bp]
UDC\textsuperscript{ 注1} \uline{\hspace{2.5in}} \\[0bp]

\begin{center}
  \fontsize{36pt}{36pt}\selectfont{\heiti
    学\chinesespace 位\chinesespace 论\chinesespace 文
  } \\[30bp]

  \fontsize{16pt}{16pt}\selectfont {\heiti\thetitle} \\ 
  \vspace{-15pt}
  \rule{5.9in}{.4pt} \\
  \fontsize{12pt}{12pt}\selectfont（题名和副题名）\\[30bp]
  \fontsize{16pt}{16pt}\selectfont{\heiti\theauthor} \\
  \vspace{-15pt}
  \rule{1.63in}{.4pt} \\
  \fontsize{12pt}{12pt}\selectfont（作者姓名） \\[30bp]

  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{4.45in}}
      指导教师 & \heiti{\theadvisor} \\
    \cline{2-2}
     \\[-24bp] & \heiti{电子科技大学 \chinesespace \chinesespace 成都} \\
    \cline{2-2}
    & \fontsize{12pt}{12pt}\selectfont（姓名、职称、单位名称）
  \end{tabular}  \\[30bp]
\end{center}

  \noindent
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{0.96in}
      >{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{2.45in}}
      申请学位级别 & {\heiti\chinesedegreename{}} &
      学科专业 & {\heiti\themajor} \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{1.0in}
      >{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{2.07in}}
      提交论文日期 &  &
      论文答辩日期 & \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{3.9in}}
      学位授予单位和日期 & \heiti{电子科技大学 \chinesespace \chinesespace  年 \chinesespace 月}   \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{2.26in}}
      答辩委员会主席 & \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{4.89in}}
      评阅人 & \\
    \cline{2-2}
  \end{tabular}

\vspace{0.54in}
\noindent
注1：注明《国际十进分类法UDC》的类号。

%\blankpage
\newpage
\thispagestyle{empty}  
\begin{center}
	\fontsize{22pt}{22pt}\selectfont ~~~~~~~~~~ \\[20bp]
	\fontsize{18pt}{18pt}\selectfont \textbf{\thetitleEn} \\[210bp]
	\fontsize{14pt}{14pt}\selectfont A Doctoral Dissertation Submitted to \\[12bp]
	\fontsize{14pt}{14pt}\selectfont
	{\MakeUppercase University of Electronic Science and Technology of China} \\[160bp]

	\renewcommand\arraystretch{1.3}
	\begin{tabular}{>{\fontsize{16pt}{16pt}\selectfont}l
			>{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
			p{4.7in}}
		Discipline: & \textbf{\themajorEn} \\
		\cline{2-2}
		~~~~~~Author: & \textbf{\theauthorEn} \\
		\cline{2-2}
		Supervisor: & \textbf{\theadvisorEn} \\
		\cline{2-2}
		~~~~~~School: & \textbf{\theschool} \\
		\cline{2-2}
		
	\end{tabular}
\end{center}

%\blankpage
\newpage
\setcounter{page}{0}
\setcounter{pseudopage}{0}
\setlength{\extrarowheight}{5pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newcommand{\fourthtitlepage}{%
\newpage
\thispagestyle{empty}
\linespread{1.5}
\begin{center}
{\bf\zihao{}独创性声明}\par
\end{center}
{\zihao{}\qquad 本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。据我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得电子科技大学或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。\par
~\par
作者签名：\makebox[5em][l]{\uline{\hfill}}\hfill
日期：\qquad{}年\qquad{}月\qquad{}日 \par
~\par
\begin{center}
{\bf\zihao{}论文使用授权}\par
\end{center}
{\zihao{}\qquad 本学位论文作者完全了解电子科技大学有关保留、使用学位论文的规定，有权保留并向国家有关部门或机构送交论文的复印件和磁盘，允许论文被查阅和借阅。本人授权电子科技大学可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。\par
（保密的学位论文在解密后应遵守此规定） \par
~\par
}
\qquad 作者签名：\makebox[5em][l]{\uline{\hfill}}\hfill
导师签名：\makebox[7em][l]{\uline{\hfill}}\par
\hfill 日期：\qquad{}年\qquad{}月\qquad{}日 \par
}
\clearpage{\pagestyle{empty}\cleardoublepage}
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

}

\ProcessOptions\relax

\newcommand{\standardhead}{
  \fancyhf{}
  \fancyhead[CO]{\fontsize{10.5pt}{12.6pt}\selectfont\leftmark}
  \fancyhead[CE]{\fontsize{10.5pt}{12.6pt}\selectfont \englishbooktitle{} of University of Electronic Science and Technology of China}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
}

\pretocmd{\tableofcontents}{
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont Contents}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \pdfbookmark{Contents}{toc}
}{}{}

\newcommand{\thesistableofcontents}{
  \tableofcontents
 \checkoddpage
\ifoddpage
\blankpage
\else
\newpage
\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\chaptermark}[1]{\markboth{Chapter \arabic{chapter} #1}{}}

\newcommand{\thesisacknowledgement}{
  \renewcommand\thesection{\arabic{section}}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \setcounter{section}{0}
  \chapter*{Acknowledgements}
  \addcontentsline{toc}{chapter}{Acknowledgements}
  \markboth{Acknowledgements}{Acknowledgements}
  \thispagestyle{fancy}
}

\newcommand{\thesischapterexordium}{
    \newpage
  \addtocontents{toc}{\protect\setcounter{tocdepth}{4}}
  \standardhead
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \chapter{Introduction}
    \chaptermark{Introduction}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thesisappendix}{
  \chapter*{Appendix}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{Appendix}
    \markboth{Appendix}{Appendix}
    \thispagestyle{fancy}
    \renewcommand{\theequation}{a-\arabic{equation}}
    \renewcommand{\thetable}{a-\arabic{table}}
    \renewcommand{\thefigure}{a-\arabic{figure}}
}

\newcommand{\thesistranslationoriginal}{
  \chapter*{Original Foreign Materials}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{Original Foreign Materials}
    \markboth{
      Original Foreign materials}{
      Original Foreign materials}
    \thispagestyle{fancy}
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\figurename}{Figure}
    \renewcommand{\tablename}{Table}
}

\newcommand{\thesistranslationchinese}{
  \chapter*{外文资料译文}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{外文资料译文}
    \markboth{外文资料译文}{外文资料译文}
    \thispagestyle{fancy}
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\figurename}{图}
    \renewcommand{\tablename}{表}
}

\makeatletter
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\makeatother






\patchcmd\thebibliography
    {\labelsep}
    {\labelsep\itemsep=0pt\parsep=0pt\relax}
    {}
    {\typeout{Couldn't patch the command}}

\newenvironment{thesisbibliography}{
  \begin{thebibliography}{lok}
    \interlinepenalty=10000
    \begin{spacing}{1.667}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}
  \end{thebibliography}
}

\pretocmd{\bibliography}{
  \thispagestyle{fancy}
  \interlinepenalty=10000
  \begin{spacing}{1.667}
}{}{}

\apptocmd{\bibliography}{
  \end{spacing}
}{}{}

\newcommand{\thesisloadbibliography}[2][]{
  \ifthenelse{
      \equal{#1}{nocite}
    }{
      \nocite{*}
    }{}
  \bibliographystyle{thesis-uestc}
  \bibliography{#2}
}

\newcites{achievement}{Academic Achievements During The \englishdegreename{} Study}

\newenvironment{thesisachievement}{
  \renewcommand{\bibname}{Academic Achievements During The \englishdegreename{} Study}
  \begin{thebibliography}{lok}
  \interlinepenalty=10000
  \begin{spacing}{1.667}
  \thispagestyle{fancy}
  \small
}{
  \end{spacing}\end{thebibliography}
  \renewcommand{\bibname}{References}
}

\newcommand{\thesisloadachievement}[1]{
  \nociteachievement{*}
  \renewcommand{\bibname}{Academic Achievements During The \englishdegreename{} Study}
  \thispagestyle{fancy}
  \begin{spacing}{1.667}
  \bibliographystyleachievement{thesis-uestc}
  \bibliographyachievement{#1}
  \end{spacing}
  \renewcommand{\bibname}{References}
}



\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\heiti}{}{ }{}
\theoremstyle{dotless}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}[theorem]{公理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{definition}[theorem]{定义}
\newtheorem{example}[theorem]{例子}


\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{证明}

\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}
  \normalfont
  \topsep0pt \partopsep0pt
  \trivlist
  \item[\hskip5\labelsep
        \heiti
    #1\@addpunct{:}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}
\makeatother

\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}}
\setlist{noitemsep}
\setlist{nolistsep}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{8pt}
  \setlength{\belowdisplayskip}{8pt}
  \setlength{\belowdisplayshortskip}{8pt}
  \setlength{\abovedisplayshortskip}{8pt}
}

\endinput