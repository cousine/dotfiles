alias tx=start_tmux_session

start_tmux_session ()
{
  tmux new-session -A -s "cousine-main"
}
