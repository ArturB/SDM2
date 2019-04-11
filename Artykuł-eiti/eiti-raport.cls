%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Simple and elegant academic report    %
%   Copyright by Artur M. Brodzki, 2019   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{eiti-raport}

\LoadClass[a4paper,12pt]{article}

%--------------------------------
% Common packages
%--------------------------------
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage[
	font=small, 
	labelfont=bf
]{caption}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage{fourier}
\RequirePackage[myheadings]{fullpage}
\RequirePackage{graphicx}
\RequirePackage{ifluatex}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\RequirePackage{lastpage}
\RequirePackage{lipsum}
\RequirePackage{listings}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage{sectsty}
\RequirePackage{subcaption}
\RequirePackage{url}
\RequirePackage{wrapfig}
\RequirePackage{xcolor}
\RequirePackage{xkeyval}

%--------------------------------------
% PdfTeX specific configuration
%--------------------------------------
\ifpdf
	\RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[
		protrusion=true,
	expansion=true
	]{microtype}
\fi

%--------------------------------------
% XeTeX specific configuration
%--------------------------------------
\ifxetex
	\RequirePackage{fontspec-xetex}
	\RequirePackage[
		protrusion=true,
	]{microtype}
\fi

%--------------------------------------
% LuaTeX specific configuration
%--------------------------------------
\ifluatex
	\RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{luainputenc}
	\RequirePackage[
		protrusion=true,
	expansion=true
	]{microtype}
\fi

%--------------------------------
% Define hyperref colors
%--------------------------------
\RequirePackage{hyperref}
\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=black
}

%--------------------------------------
% Define and process class parameters
% Default margin is 2.5 cm
%--------------------------------------
\define@key{eiti-raport.cls}{margin}[2.5cm]{
	\def\margin{#1}
}
\ExecuteOptionsX{margin}
\ProcessOptionsX
\usepackage[
	a4paper, 
	margin=\margin
]{geometry}

%--------------------------------
% Initial setup
%--------------------------------
\onehalfspacing

%--------------------------------
% Header and footer
%--------------------------------
\pagestyle{fancy}
\setlength\headheight{15pt}
\fancyhf{}
\fancyheadoffset{0cm} 
\fancyfoot{}
\fancyfoot[C]{\thepage}

%--------------------------------
% Auxiliary commands
%--------------------------------
\newcommand{\HRule}[1]{\rule{\linewidth}{#1}}

%--------------------------------
% Strona tytułowa - makra
%--------------------------------
\renewcommand{\author}[1]{
	\renewcommand{\@author}{#1}
}
\newcommand{\subtitle}[1]{
	\newcommand{\@subtitle}{#1}
}
\newcommand{\subject}[1] {
	\newcommand{\@subject}{#1}
}

%--------------------------------
% Strona tytułowa
%--------------------------------
\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
	\thispagestyle{plain}
	
	\begin{center}
		\LARGE 
		
		\vspace*{1cm}
		\@subject \\ 
		\HRule{0.5pt} \\ 
		\textbf{\MakeUppercase\@title} \\ 
		\large
		\ifx \@subtitle \undefined
		\else
			\vspace*{0.25cm}
			\@subtitle
		\fi
		\HRule{2pt} \\ 
		\vspace*{0.5cm}
		\@author \\ 
		\vspace{0.25cm}
		\@date
		
		\normalsize
	\end{center}

	
	\sectionfont{\LARGE\scshape}
	\setcounter{page}{1}
}

\endinput
