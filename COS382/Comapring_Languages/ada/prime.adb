with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
 
procedure Prime_Problem is
   n : Integer;
   type myArray is array(Integer range <>) of Integer;

   function is_primes(a: Integer) return Boolean is
   begin
      if a <= 1 then
      return False;
      end if;
      for i in 2..a-1 loop
         if a mod i = 0 then
            return False;
         end if;
      end loop;
      return True;
   end is_primes

begin
   n := 40;

   declare
      primes : myArray(0..n);
   begin--start filling array with primes
      for I in 0..n loop
         if is_primes(I) then
            primes(I) := I;
         else
            primes(n+1);
         end if;
      end loop;
      for I in 0..n loop
         put(primes(I));
      end loop;
   end;
end Prime_Problem;