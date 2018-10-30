@echo off
setlocal ENABLEDELAYEDEXPANSION
for %%i in (.*) do (
  if not %%i == .bashrc (
    echo %HOMEPATH%\%%i %HOMEPATH%\dotfiles\%%i
    mklink %HOMEPATH%\%%i %HOMEPATH%\dotfiles\%%i
  )
)
rem looking for a better way to remove this dupe
for /D %%i in (.*) do (
  set SKIP=FALSE
  if %%i == .git (
    set SKIP=TRUE
  )
  if %%i == .cache (
    set SKIP=TRUE
  )
  if %%i == .config (
    set SKIP=TRUE
  )
  if !SKIP! == FALSE (
    echo /D %HOMEPATH%\%%i %HOMEPATH%\dotfiles\%%i
    mklink /D %HOMEPATH%\%%i %HOMEPATH%\dotfiles\%%i
  )
)

@echo off
rem # .bashrc could be different per project
rem for f in .??*
rem do
rem   [[ "$f" == ".git" ]] && continue
rem   [[ "$f" == ".bashrc" ]] && continue
rem   [[ "$f" == ".cache" ]] && continue
rem   [[ "$f" == ".config" ]] && continue
rem 
rem   ln -snfv $(pwd -P)/"$f" "$HOME"/"$f"
rem done
rem 
rem ln -snfv $(pwd -P)/.config/nvim "$HOME"/.config/
rem 
rem source $HOME/.bashrc
