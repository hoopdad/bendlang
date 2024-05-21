 rustup self uninstall
 curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
 . $HOME/.cargo/env
 cargo +nightly install hvm
 cargo +nightly install bend-lang
