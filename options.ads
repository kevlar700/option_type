generic
   --  If the Status_Code is a separate out parameter then GNAT will
   --  warn you when it isn't checked with --gnatw.o. 
   --  type Status_Code is limited private;
   type Item is limited private;
package Options is

   type Output (Output_Available : Boolean := True) is record
      --  Status : Status_Code;
      case Output_Available is
         when True =>
            Output : Item;

         when False =>
            null;
      end case;
   end record;

end Options;
