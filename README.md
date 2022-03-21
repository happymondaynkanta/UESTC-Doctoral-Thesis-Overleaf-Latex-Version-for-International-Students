# UESTC-Doctoral-Dissertation-Overleaf-Latex-Version-for-International-Students
This is the Overleaf Latex version of UESTC Doctoral Thesis for International PhD students who wish to format their final dissertation using overleaf latex template rather than word template which comes with so much setbacks.

# Short brief
UESTC Thesis in overleaf latex version for doctoral International Students. The UESTC Thesis overleaf version available to postgraduate International Students has been repeatedly reported to have some bugs by the students and which makes it difficult for international students to cope with the required format. Issues like wrong page numbering, interference between roman and arabic numbering, inconsistent page header and unnecessary blank pages. In this repository, I have addressed all those bugs, and re-organized the UESTC Thesis overleaf latex version to suit the requirement for doctoral dissertation format. 

# Disclaimer!  
This is an independent task and the author of this repository has no cooperation with the authorities of the University of Electronic Science and Technology of China. You are free to use this for your document formatting. 


![Doctoral](https://user-images.githubusercontent.com/63404097/150163087-e350a4c3-0916-462c-bcce-805bdd66e45a.PNG)


View of the front cover of the doctoral thesis

# organization of the Thesis Contents
Each chapter is organized in a file called .tex inside the chapter folder.
Images and diagrams corresponding to each chapter are organized in separate sub-folders inside the Pic folder

![left panel](https://user-images.githubusercontent.com/63404097/150158245-5d5aa229-aa3f-4015-b2d0-d6ea7b1186cf.PNG)

picture showing how the contents are organized




# 2022 UESTC Thesis/Dissertation New Format

In 20202, UESTC made few changes to the Thesis and Dissertation format. These changes are mainly on the sytle of the Table and the Reference style.
I have provided the code to correctly effect the new style of the Table and I have also included a new source file named "thesis-uestc.bst" to handle the new changes to the reference format.  

## Example 1 of the new Table style

\begin{table}[H] 
\caption{Evaluation performance of our proposed WMR-DepthwiseNet model in comparison with several COVID-19 image-based screening methods for both CXR and CT datasets.\label{tab8}}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\begin{tabularx}{\textwidth}{m{4.5cm}m{2cm}m{2cm}m{2cm}}
\toprule
    \textbf{Methods} & \textbf{SEN~(\%)}  &  \textbf{SPE~(\%)}      & \textbf{ACC~(\%)} \\  
\midrule
		 Chen et al. \citep{11} & 100 & 93.6 & 95.2      \\  
		 Barstugan et al. \citep{40} & 91.8 & 92.3 & 90.7  \\  
		 Wang et al. \citep{12} & 90.4 & 89.5 & 92.3      \\ 
		 Li et al. \citep{37} & 90.0 & 96.0 & 92.3       \\ 
		 Song et al. \citep{42} & 96.0 & 77.0 & 86.1    \\ 
		 Shi et al. \citep{41} & 90.7 & 87.2 & 89.4     \\  
		 Wang et al. \citep{33} & 85.9 & 89.4 & 82.9    \\  
		 Jin et al. \citep{52} & 94.1 & 95.5 & 96.5     \\ 
		 Xu et al. \citep{53} & 87.9 & 90.7 & 86.7     \\ 
		 Jin et al. \citep{54} & 97.4 & 92.2 & 95.7    \\  
		 WMR-DepthwiseNet-D (CXR) & 98.46 & 97.99 & 98.63 \\ 
		 WMR-DepthwiseNet-D (CT) & 97.78 & 96.22 & 96.83 \\  
\bottomrule
\end{tabularx}
\end{table}


![new-table-1](https://user-images.githubusercontent.com/63404097/159204327-f9fd8a20-a152-40f0-b959-d83c3a8f68f0.PNG)


## Example 2 of the new Table style

\begin{table}[H]
\tablesize{\footnotesize}
\caption{Comparison of our proposed WMR-DepthwiseNet with other selected state-of-the-art COVID-19 models using the same training data distribution for CXR dataset.\label{tab9}}
	\begin{adjustwidth}{-\extralength}{0cm}
		\newcolumntype{C}{>{\centering\arraybackslash}X}
		\begin{tabularx}{\textwidth+\extralength}{m{4cm}m{2cm}m{2cm}m{2cm}m{2cm}m{2cm}m{2cm}}
		\toprule
\textbf{Model} & \textbf{SEN (\%)} & \textbf{SPE (\%)} & \textbf{ACC (\%)} & \textbf{AUC (\%)} & \textbf{PREC (\%)} & \textbf{Time (min)} \\
\midrule		
COVID-Net \citep{33} &  94.20   & 93.99   & 94.86    & 94.32     & 95.56  & 26.4 \\ 
DeCoVNet  \citep{55} &  97.21  & 97.68   & 97.78    & 97.21    & 97.41    & 22.8\\ 
Cov-Net \citep{37} &  97.92   & 96.28   & 97.67    & 96.27     & 97.65    & 23.7\\
DeepPneumonia \citep{42} &  90.72   & 91.20   & 90.78    & 90.06     & 91.80  & 25.8 \\ 
 WMR-DepthwiseNet-D (CXR) & 98.46 & 97.99 & 98.63 & 98.72 & 98.69  & 15.6 \\   
			\bottomrule
		\end{tabularx}
	\end{adjustwidth}
	
\end{table}


![new-table-2](https://user-images.githubusercontent.com/63404097/159204439-5d8010b4-32cf-4d2e-b21e-5e0799b7be4f.PNG)


###  The changes made to handle the new reference format

The picture illustrates the change that was made. The previous source file was renamed to 'thesis-uestc-old.bst' and the new source file is named "thesis-uestc.bst"


![thesis-uestc-new](https://user-images.githubusercontent.com/63404097/159205952-c4a9817b-49b4-4ed7-9fed-743ddbd13f28.PNG)



### Result of the reference Style using the old source file ('thesis-uestc-old.bst')

![reference 1](https://user-images.githubusercontent.com/63404097/159206675-13c47afe-cbda-4bea-a7ee-00b7fe065d2a.PNG)



### Result of the reference Style using the new source file ('thesis-uestc.bst')

![reference 2](https://user-images.githubusercontent.com/63404097/159206239-6599d17a-39a3-48b9-806a-90a3a8b74dd3.PNG)




