# Keep non-interactive ssh commands able to find Codex installed under nvm.
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

codex_bins=("$NVM_DIR"/versions/node/*/bin/codex(N))
if (( ${#codex_bins} )); then
  codex_bin_dir="${codex_bins[-1]:h}"
  case ":$PATH:" in
    *":$codex_bin_dir:"*) ;;
    *) export PATH="$codex_bin_dir:$PATH" ;;
  esac
  unset codex_bin_dir
fi
unset codex_bins
