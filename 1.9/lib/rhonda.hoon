|%
::
:: check if a given input is a Rhonda number for a given base
::
++  check
  |=  [base=@ud num=@ud]
  ^-  ?
  ?:  (lte base 1)
    !!
  =((roll (get-base-digits base num) mul) (mul base (roll (prime-factors num) add)))
::
:: returns the first n Rhonda numbers in a base or ~ if the base is prime
::
++  series
  |=  [base=@ud n=@ud]
  ^-  (list @ud)
  ?:  (lte base 1)
    !!
  ::  checking if the base is prime.
  ::
  ?:  =((prime-factors base) ~[base])
    ~
  ::  variable for the output
  ::
  =/  result  *(list @ud)
  ::  iteration variable to check if it's a Rhonda number
  ::
  =/  iter  1
  ::  iteration variable in base digit representation as a list, to save time by preventing repeated conversion
  ::
  =/  iterbase  (limo [1 ~])
  :: length variable to prevent repeated calls of lent on the result
  ::
  =/  length  0
  |-
    ::  output if finished
    ::
    ?:  =(length n)
      (flop result)
    ::  check if the current number is a Rhonda number in the base
    ::
    ?:  =((roll iterbase mul) (mul base (roll (prime-factors iter) add)))
      ::  if so add it to the result and check higher
      ::
      $(result [iter result], length +(length), iter +(iter), iterbase (increment-num-in-base iterbase base))
    ::  otherwise just check higher
    ::
    $(iter +(iter), iterbase (increment-num-in-base iterbase base))
::
::  returns the base decomposition of a number as a list of digits
::
++  get-base-digits
  |=  [base=@ud num=@ud]
  ^-  (list @ud)
  ?:  (lte base 1)
    !!
  ::  define the output
  ::
  =/  result  *(list @ud)
  |-
    ::  loop until there are no more digits
    ::
    ?:  =(num 0)
      (flop result)
    =/  division  (dvr num base)
    ::  divide the number by the base, prepend the remainder to the result and loop
    ::
    $(result [q.division result], num p.division)
::
:: returns the prime factorization of a number as a list
::
++  prime-factors
  |=  num=@ud
  ^-  (list @ud)
  ::  define the output
  ::
  =/  result  *(list @ud)
  ::  used to iterate on possible prime factors starting from 2
  ::
  =/  iter  2
  |-
    ::  if the number is 1, there are no more factors
    ::
    ?:  =(num 1)
      result
    ::  divide the number by the current factor, get result and remainder
    ::
    =/  division  (dvr num iter)
    ::  if it divides cleanly, then add the current factor to the list of prime factors and loop on the result
    ::
    ?:  =(q.division 0)
      $(num p.division, result [iter result])
    ::  if the current factor is greater than the square root of the number, then add the number as a factor and terminate
    ::
    ?:  (gth iter p.division)
      [num result]
    :: in all other cases just increment the factor and keep testing
    ::
    $(iter +(iter))
::
::  increments a base decomposition of a number (a list of digits) by 1.
::  this functionality is implemented to speed up the series function and avoid repeated calls to get-base-digits
::
++  increment-num-in-base
  ::  input is a number as a list of digits and a base
  ::
  |=  [num=(list @ud) base=@ud]
  ^-  (list @ud)
  ::  length variable to avoid repeated calls to lent
  ::
  =/  length  (lent num)
  ::  iterate to potentially carry a digit when adding
  ::
  =/  index  0
  |-
    ::  if we carry a digit to the end (e.g. 999 + 1) then append a 1
    ::
    ?:  =(index length)
      (snoc num 1)
    ::  incrementation
    ::
    =/  num  (snap num index (add (snag index num) 1))
    ::  if we need to carry a digit
    ::
    ?:  (gte (snag index num) base)
      ::  then make the current digit 0 and loop
      ::
      $(index +(index), num (snap num index 0))
    :: otherwise return the incremented number
    ::
    num
--
