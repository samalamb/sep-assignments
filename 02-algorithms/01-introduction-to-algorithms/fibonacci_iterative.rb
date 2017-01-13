class Fib

  def initialize

  end

  def fib(n)
    fib_0 = 0
    fib_1 = 1

    if n == 0
      return 0
    elsif n == 1
      return 1
    end

    (1..(n - 1)).each do
      temp = fib_0
      fib_0 = fib_1

      fib_1 = temp + fib_1
    end
    return fib_1
  end
end
