FROM sergeypotemkin/blackwell_cuda12.8_pytorch2.8.0_py3.10_ubuntu22.04:latest

RUN pip install --no-cache-dir \
    ipython==8.14.0 \
    ipykernel==6.25.0 \
    notebook==6.5.4 \
    jupyter-client==8.3.0 \
    jupyter-core==5.3.1 \
    traitlets==5.9.0 \
    nbformat==5.9.0 \
    nbconvert==7.6.0

RUN pip install --no-cache-dir \
    huggingface_hub \
    protobuf \
    decord \
    matplotlib \
    pillow \
    requests \
    tqdm

# Были конфликты, вроде стабильно
RUN pip uninstall numpy -y && pip install --no-cache-dir numpy==1.24.3

WORKDIR /workspace

ENV JUPYTER_TOKEN=""
ENV JUPYTER_PASSWORD=""
ENV SHELL=/bin/bash

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''", "--NotebookApp.open_browser=False"]