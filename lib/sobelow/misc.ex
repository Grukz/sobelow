defmodule Sobelow.Misc do
  @submodules [Sobelow.Misc.BinToTerm, Sobelow.Misc.FilePath]
  use Sobelow.FindingType

  def get_vulns(fun, meta_file, _web_root, skip_mods \\ []) do
    allowed = @submodules -- (Sobelow.get_ignored() ++ skip_mods)

    Enum.each allowed, fn mod ->
      apply(mod, :run, [fun, meta_file])
    end
  end
end