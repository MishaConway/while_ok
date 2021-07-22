defmodule WhileOk do
  # Enumerates over enumerable while the given func returns an ok tuple.
  # If an error tuple is ever returned, then enumeration is halted and the error value is returned.
  def each(enumerable, func, [return_when_all_ok: return_when_all_ok] = opts) do
    case enumerable do
      [] -> return_when_all_ok
      [head | tail] ->
        case func.(head) do
          {:ok, _ } -> each(tail, func, opts)
          {:error, _} = err -> err
        end
    end
  end
end