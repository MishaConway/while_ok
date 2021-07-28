defmodule WhileOk do
  # Enumerates over enumerable while the given func returns an ok tuple.
  # If an error tuple is ever returned, then enumeration is halted and the error value is returned.
  def each(enumerable, func, [return_when_all_ok: return_when_all_ok] = opts) do
    case enumerable do
      [] -> return_when_all_ok
      [head | tail] ->
        case func.(head) do
          {:ok, _} -> each(tail, func, opts)
          {:ok} -> each(tail, func, opts)
          :ok -> each(tail, func, opts)
          {:error, _} = err -> err
        end
    end
  end

  def map(enumerable, func), do: map_ex(enumerable, func, [])

  defp map_ex(enumerable, func, already_mapped) do
    case enumerable do
      [] -> {:ok, already_mapped}
      [head | tail] ->
        case func.(head) do
          {:ok, mapped_result} -> map_ex(tail, func, already_mapped ++ [mapped_result])
          {:error, _} = err -> err
        end
    end
  end
end