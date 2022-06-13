::  rhonda number validator/generator
::  https://www.numbersaplenty.com/set/Rhonda_number/
::
|%
  ++  as-base                     :: convert n to base b
    |=  [b=@ud n=@ud]
    ^-  (list @ud)
    =+  p=(log-base b n)
    =|  l=(list @ud)
    |-
    ?:  =(p 0)
      [n l]
    =+  btop=(pow b p)
    =+  next=(div n btop)
    $(p (dec p), n (sub n (mul next btop)), l [next l])
  ++  log-base                    :: b-based unsigned log of value n
    |=  [b=@ud n=@ud]
    ^-  @ud
    =+  p=1
    |-
    ?:  (lth n (pow b p))
      (dec p)
    $(p +(p))
  ++  prime-factors               :: prime number factors of n
    |=  n=@ud
    ^-  (list @ud)
    ~+
    =|  l=(list @ud)
    =/  i=@ud  2
    |-
    ?:  (gth i -:(sqt n))
      ?:  (gth n 2)
        [n l]
      l
    |-
    ?:  !=((mod n i) 0)
      ^$(i +(i))
    $(n (div n i), l [i l])
  ++  is-prime                    :: is given @ud a prime number?
    |=  n=@ud
    ^-  bean
    ~+
    ?:  (lte n 1)  %.n
    ?:  (lte n 3)  %.y
    %+  levy  (gulf 2 -:(sqt n))
    |=(i=@ud !=((mod n i) 0))
--
::
|%
  ++  check                       :: check if n is rhonda in base b
    :: rhonda(b, n) := Π_digits(n_b) == b * Σ_values(prime-factors(n))
    |=  [b=@ud n=@ud]
    ^-  bean
    :: https://mathworld.wolfram.com/RhondaNumber.html
    :: "Rhonda numbers exist only for bases that are composite since
    :: there is no way for the product of integers less than a prime b
    :: to have b as a factor."
    ?:  (is-prime b)
      %.n
    =+  baseb=(as-base b n)
    =+  facts=(prime-factors n)
    .=  (roll baseb mul)
    (mul b (roll facts add))
  ++  series                      :: list first n rhondas of base b
    |=  [b=@ud n=@ud]
    ^-  (list @ud)
    =|  l=(list @ud)
    =/  i=@ud  2
    =/  c=@ud  0
    ?:  (is-prime b)
      l
    |-
    ?:  =(c n)
      (flop l)
    ?.  (check b i)
      $(i +(i))
    $(i +(i), c +(c), l [i l])
--
