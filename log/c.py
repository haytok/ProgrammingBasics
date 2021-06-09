# A op1 B op2 C op3 D

# 目的  [0+0+0+0, 0+0+0+1 ...]

def concat(value, array):
    print(value, array)
    return [item + value for item in array]

def main(n, array):
    if n == 1:
        return list(map(str, range(10)))
    else:
        if n % 2 == 1:
            for i in range(10):
                return concat(str(i), main(n - 1, array))
        else:
            for op in ['+', '-']:
                return concat(op, main(n - 1, array))

if __name__ == '__main__':
    test_1 = concat('+', list(map(str, range(10))))
    print(test_1)
    test_2 = concat('1', [])
    print(test_2)
    print('-' * 10)
    print(main(6, list(map(str, range(10)))))

#let rec hojo lst n = match lst with
#     [] -> if n = 0 then ["0"; "1"; "2"; "3"; "4"; "5"; "6"; "7"; "8"; "9"] else []
#     | first :: rest ->
#         if n = 0 then ["0"; "1"; "2"; "3"; "4"; "5"; "6"; "7"; "8"; "9"]
#         else if n mod 2 = 1
#         then [first ^ "-"; first ^ "+"] @ hojo rest n
#         else [
#             first ^ "1";
#             first ^ "2";
#             first ^ "3";
#             first ^ "4";
#             first ^ "5";
#             first ^ "6";
#             first ^ "7";
#             first ^ "8";
#             first ^ "9";
#         ] @ hojo rest n;;

# hojo [] 0;;
# hojo ["0"; "1"; "2"; "3"; "4"; "5"; "6"; "7"; "8"; "9"] 1;;

# let ans =
#     hojo (hojo (hojo (hojo (hojo (hojo (hojo [] 0) 1) 2) 3) 4) 5) 6;;

# let cal value = int_of_string value;;
# let sum n =
#     let rec sum_loop n acc =
#         if n <= 0 then acc
#         else sum_loop (n-1) (n + acc) in
#             sum_loop n 0;;
