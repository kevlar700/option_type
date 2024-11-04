generic
   type Status_Code is limited prrivate;
   type Item is limited private;
package Option is

   type Result (Output_Available : Boolean := True) is record
      Status : Status_Code;
      case Output_Available is
         when True =>
            Output : Item;

         when False =>
            null;
      end case;
   end record;

end Option;
