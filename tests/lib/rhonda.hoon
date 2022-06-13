/+  *test, *rhonda
|%
++  test-check-four
  ;:  weld
  %+  expect-eq
    !>  %.n
    !>  (check 4 10.000)
  %+  expect-eq
    !>  %.y
    !>  (check 4 10.206)
  %+  expect-eq
    !>  %.n
    !>  (check 4 10.500)
  %+  expect-eq
    !>  %.y
    !>  (check 4 11.935)
  %+  expect-eq
    !>  %.n
    !>  (check 4 50.000)
  %+  expect-eq
    !>  %.y
    !>  (check 4 94.185)
  ==
++  test-check-six
  ;:  weld
  %+  expect-eq
    !>  %.n
    !>  (check 6 800)
  %+  expect-eq
    !>  %.y
    !>  (check 6 855)
  %+  expect-eq
    !>  %.n
    !>  (check 6 1.000)
  %+  expect-eq
    !>  %.y
    !>  (check 6 1.029)
  %+  expect-eq
    !>  %.n
    !>  (check 6 18.181)
  %+  expect-eq
    !>  %.y
    !>  (check 6 19.136)
  ==
++  test-check-eight
  ;:  weld
  %+  expect-eq
    !>  %.n
    !>  (check 8 1.200)
  %+  expect-eq
    !>  %.y
    !>  (check 8 1.836)
  %+  expect-eq
    !>  %.n
    !>  (check 8 4.800)
  %+  expect-eq
    !>  %.y
    !>  (check 8 6.622)
  %+  expect-eq
    !>  %.n
    !>  (check 8 18.181)
  %+  expect-eq
    !>  %.y
    !>  (check 8 25.398)
  ==
++  test-check-nine
  ;:  weld
  %+  expect-eq
    !>  %.n
    !>  (check 9 15.000)
  %+  expect-eq
    !>  %.y
    !>  (check 9 15.540)
  %+  expect-eq
    !>  %.n
    !>  (check 9 20.000)
  %+  expect-eq
    !>  %.y
    !>  (check 9 21.054)
  %+  expect-eq
    !>  %.n
    !>  (check 9 45.000)
  %+  expect-eq
    !>  %.y
    !>  (check 9 47.652)
  ==
++  test-check-ten
  ;:  weld
  %+  expect-eq
    !>  %.n
    !>  (check 10 1.000)
  %+  expect-eq
    !>  %.y
    !>  (check 10 1.568)
  %+  expect-eq
    !>  %.n
    !>  (check 10 2.000)
  %+  expect-eq
    !>  %.y
    !>  (check 10 2.835)
  %+  expect-eq
    !>  %.n
    !>  (check 10 12.000)
  %+  expect-eq
    !>  %.y
    !>  (check 10 12.985)
  ==
++  test-check-twelve
  ;:  weld
  %+  expect-eq
    !>  %.n
    !>  (check 12 500)
  %+  expect-eq
    !>  %.y
    !>  (check 12 560)
  %+  expect-eq
    !>  %.n
    !>  (check 12 1.000)
  %+  expect-eq
    !>  %.y
    !>  (check 12 3.993)
  %+  expect-eq
    !>  %.n
    !>  (check 12 50.000)
  %+  expect-eq
    !>  %.y
    !>  (check 12 58.504)
  ==
++  test-series-three
  ;:  weld
  %+  expect-eq
    !>  ~
    !>  (series 3 5)
  ==
++  test-series-four
  ;:  weld
  %+  expect-eq
    !>  `(list @ud)`~[10.206]
    !>  (series 4 1)
  %+  expect-eq
    !>  `(list @ud)`~[10.206 11.935 12.150 16.031]
    !>  (series 4 4)
  %+  expect-eq
    !>  `(list @ud)`~[10.206 11.935 12.150 16.031 45.030 94.185]
    !>  (series 4 6)
  ==
++  test-series-six
  ;:  weld
  %+  expect-eq
    !>  `(list @ud)`~[855]
    !>  (series 6 1)
  %+  expect-eq
    !>  `(list @ud)`~[855 1.029 3.813 5.577]
    !>  (series 6 4)
  %+  expect-eq
    !>  `(list @ud)`~[855 1.029 3.813 5.577 7.040 7.304]
    !>  (series 6 6)
  ==
++  test-series-nine
  ;:  weld
  %+  expect-eq
    !>  `(list @ud)`~[15.540]
    !>  (series 9 1)
  %+  expect-eq
    !>  `(list @ud)`~[15.540 21.054 25.331]
    !>  (series 9 3)
  %+  expect-eq
    !>  `(list @ud)`~[15.540 21.054 25.331 44.360 44.660 44.733 47.652]
    !>  (series 9 7)
  ==
++  test-series-ten
  ;:  weld
  %+  expect-eq
    !>  `(list @ud)`~[1.568]
    !>  (series 10 1)
  %+  expect-eq
    !>  `(list @ud)`~[1.568 2.835 4.752 5.265 5.439 5.664 5.824]
    !>  (series 10 7)
  %+  expect-eq
    !>  `(list @ud)`~[1.568 2.835 4.752 5.265 5.439 5.664 5.824 5.832 8.526 12.985]
    !>  (series 10 10)
  ==
++  test-series-sixteen
  ;:  weld
  %+  expect-eq
    !>  `(list @ud)`~[1.000 1.134]
    !>  (series 16 2)
  %+  expect-eq
    !>  `(list @ud)`~[1.000 1.134 6.776 15.912 19.624]
    !>  (series 16 5)
  %+  expect-eq
    !>  `(list @ud)`~[1.000 1.134 6.776 15.912 19.624 20.043 20.355 23.946 26.296]
    !>  (series 16 9)
  ==
--
