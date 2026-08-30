%% 2026 NSFC application-body class
%% Organized from the public layout reference at:
%% https://github.com/andy123t/nsfc-latex
%% Reference commit: 11a02726f6190fcb89859dfaed18e3d1d68af0b8
\ProvidesClass{nsfc}[2026/08/30 NSFC application body]
\NeedsTeXFormat{LaTeX2e}

\newif\ifnsfc@GP\nsfc@GPfalse
\newif\ifnsfc@YF\nsfc@YFfalse
\DeclareOption{GP}{\nsfc@GPtrue}
\DeclareOption{YF}{\nsfc@YFtrue}
\ExecuteOptions{GP}
\ProcessOptions\relax

\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[UTF8,zihao=-4,punct,oneside,fontset=none]{ctexbook}

% Fixed NSFC font contract. No substitute-font fallback.
\setCJKmainfont[Path=fonts/,AutoFakeSlant=0.3,AutoFakeBold=3]{SimSun.ttf}
\setCJKsansfont[Path=fonts/,AutoFakeSlant=0.3,AutoFakeBold=3]{KaiTi.ttf}
\setCJKmonofont[Path=fonts/]{FangSong.ttf}
\setCJKfamilyfont{zhkai}[Path=fonts/,AutoFakeSlant=0.3,AutoFakeBold=3]{KaiTi.ttf}
\setCJKfamilyfont{zhsong}[Path=fonts/,AutoFakeSlant=0.3,AutoFakeBold=3]{SimSun.ttf}
\newfontfamily{\enkai}[Path=fonts/,AutoFakeSlant=0.3,AutoFakeBold=3]{KaiTi.ttf}
\newfontfamily{\ensong}[Path=fonts/,AutoFakeSlant=0.3,AutoFakeBold=3]{SimSun.ttf}
\providecommand\songti{\CJKfamily{zhsong}}
\providecommand\kaishu{\CJKfamily{zhkai}}
\setsansfont[Scale=0.98]{Arial}

\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{indentfirst}
\RequirePackage[figurewithin=none]{caption}
\RequirePackage[linktoc=none,bookmarks=false]{hyperref}

\hypersetup{colorlinks=true,linkcolor=black,citecolor=black,filecolor=black,urlcolor=black}
\definecolor{NSFCblue}{RGB}{0,112,192}
\definecolor{NSFCred}{RGB}{255,0,0}

\ifnsfc@GP
  \geometry{a4paper,left=3.05cm,right=3.05cm,top=2.72cm,bottom=2.54cm}
\fi
\ifnsfc@YF
  \geometry{a4paper,left=3.2cm,right=3.2cm,top=2.72cm,bottom=2.54cm}
\fi

\defaultfontfeatures{Mapping=tex-text}
\xeCJKsetwidth{，。；}{1em}
\xeCJKsetwidth{、}{1.1em}
\xeCJKsetwidth{（）}{1em}
\xeCJKsetup{CJKecglue={\hskip 4pt plus 0.08\baselineskip}}
\ziju{0.005}
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{1pt plus 1pt minus 1pt}
\linespread{1.5}

% NSFC chapters continue on the current page.
\renewcommand{\chapter}{\secdef\@chapter\@schapter}

\titleformat{\chapter}
  {\linespread{1.3}\color{NSFCblue}\kaishu\enkai\zihao{4}}
  {\kern2.0em\textbf{（\chinese{chapter}）}}
  {0em}{}
\titleformat{\section}[block]
  {\linespread{1.3}\color{NSFCblue}\kaishu\enkai\zihao{4}}
  {\kern2.0em\arabic{section}．}
  {0em}{}
\titleformat{\subsection}[hang]
  {\linespread{1.0}\zihao{-4}}
  {\hspace{0.2em}\sffamily(\arabic{subsection})}
  {0.6em}{\bfseries}

\newcommand{\NSFCnote}[1]{%
  \begingroup
  \linespread{1.3}\color{NSFCblue}\kaishu\enkai\zihao{4}\selectfont
  \hspace*{0pt}#1\par
  \endgroup
}

\titlespacing*{\chapter}{0pt}{4pt plus 1pt minus 1pt}{0pt plus 1pt minus 1pt}
\titlespacing*{\section}{0pt}{6pt plus 1pt minus 1pt}{2pt plus 1pt minus 1pt}
\titlespacing*{\subsection}{0pt}{8pt plus 1pt minus 1pt}{2pt plus 1pt minus 1pt}

\captionsetup[figure]{position=bottom,skip={6pt},name={图}}
\captionsetup[table]{position=top,skip={3pt},name={表}}
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\floatsep}{10pt plus 2pt minus 2pt}
\setlength{\intextsep}{10pt plus 2pt minus 2pt}
\renewcommand{\theequation}{\arabic{equation}}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\figureautorefname}{图}
\renewcommand{\tableautorefname}{表}
\pagestyle{empty}
\allowdisplaybreaks

\AtBeginDocument{%
  \setlength{\abovedisplayskip}{6pt plus 2pt minus 2pt}
  \setlength{\belowdisplayskip}{6pt plus 2pt minus 2pt}
  \setlength{\abovedisplayshortskip}{3pt plus 1pt minus 1pt}
  \setlength{\belowdisplayshortskip}{3pt plus 1pt minus 1pt}
}

\renewcommand{\maketitle}{%
  \centerline{\kaishu\enkai\fontsize{16pt}{22pt}\selectfont\textbf{报告正文（{\addfontfeatures{LetterSpace=1}2026}\hspace{4.2pt}版）}}
  \vspace{6pt}
}
