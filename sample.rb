def fibonacci(n)
    a, b = 0, 1
    n.times do
      print "#{a} "
      a, b = b, a + b
    end
  end
  
  fibonacci(100)
  