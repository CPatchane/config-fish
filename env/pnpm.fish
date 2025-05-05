# pnpm global bin location (if pnpm exists)

if command -vq pnpm
  set -gx PNPM_HOME (pnpm bin --global)
  if test ["$PNPM_HOME" != ""]
      if not string match -q -- $PNPM_HOME $PATH
          set -gx PATH "$PNPM_HOME" $PATH
      end
  end
end
