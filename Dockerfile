FROM ocaml/opam:alpine-3.13-ocaml-4.06-afl

RUN sudo apk update && \
  sudo apk add opam && \
  sudo apk add rlwrap@testing

# Setting .bashrc
RUN { \
    echo "alias ll='ls -l'"; \
    echo "alias la='ls -A'"; \
    echo "alias l='ls -CF'"; \
    echo "alias ocaml='rlwrap ocaml'"; \
    echo "PS1='\[\e[1;34m\][\u@\h \W]\\$ \[\e[m\]'"; \
  } > ~/.bashrc

WORKDIR /app

CMD ["/bin/bash"]
