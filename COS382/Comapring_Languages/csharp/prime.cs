//!/usr/bin/mono

using System;
using System.Collections.Generic;
using System.Linq;

namespace PrimePartition{
  class Prime{
    static void Main(string[] args){
      List<int> prime = new List<int>();
      Console.WriteLine(" Prime Partitions Program");
      Console.WriteLine("Enter a number: ");
      int a = Convert.ToInt32(Console.ReadLine());
      for (int i = 0; i <= a; i++){
        if (is_prime(i) == true){
          prime.Add(i);
        }
      }
      prime.ToArray();
      Console.WriteLine("Primes up to "+a+": "+string.Join(" ",prime));
      List<int> primes = new List<int>();
      prime_part_constructive(a, 1, primes);
    }
    static bool is_prime(int n){
      if (n <= 1) return false;
      for (int i = 2; i <= Math.Sqrt(n); i++){
        if (n % i == 0) return false;
      }
      return true;
    }
    static void prime_part_constructive(int n, int k, List<int> lst){
      if (n == 0){
        //Console.WriteLine(n);
        lst.ToArray();
        Console.WriteLine(string.Join("+", lst));
        //Console.WriteLIne(lst);
        //lst.ForEach(Console.WriteLine);
        //Console.WriteLine(lst.ToArray());
      }
      if (n <= k){
        return;
      }
      for (int i = (k+1); i <= (n+1); i++){
        if (is_prime(i) == false){
          continue;
        }
        lst.Add(i);
        prime_part_constructive(n-i, i, lst);
        lst.Remove(i);
      }
    }
  }
}
