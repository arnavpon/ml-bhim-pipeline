# Bhim Pipeline Container
# Morey Lab
# Automated Build - Step 3

FROM arnavpon/moreylab-afni
LABEL description="Ubuntu 17.10 OS + MRtrix3 + AFNI. Used to pre-process fMRI data."
LABEL maintainer="Arnav Pondicherry <arnavpon@rwjms.rutgers.edu>"

# (1) Install R using AFNI & update to most recent AFNI version
RUN echo "Installing R & R packages from AFNI..." && echo && \
	export R_LIBS=$HOME/R && \
	mkdir $R_LIBS && \
	echo 'setenv R_LIBS ~/R' >> ~/.cshrc && \
	curl -O https://afni.nimh.nih.gov/pub/dist/src/scripts_src/@add_rcran_ubuntu.tcsh && \
	tcsh @add_rcran_ubuntu.tcsh && \
	export PATH=/root/abin:$PATH && \
	echo && echo "Installing R Packages..." && echo && \
	rPkgsInstall -pkgs ALL && \
	echo && echo "Updating SUMA env..." && echo && \
	suma -update_env && \
	@update.afni.binaries -defaults

# (2) Copy Bhim Pipeline Files to Image
COPY scripts /pipeline/

# (3) Change working directory -> /pipeline/
WORKDIR /pipeline

# (4) Start up tcsh - user can manually run `tcsh run.test subj_id`
CMD ["tcsh"]
