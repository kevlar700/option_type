# option_type
A Generic Option Result Type

This works by the fact that an unconstrained variant record can be replaced by setting all record components using an aggregate. An unconstrained variant record is one with a default value *AND* not initialised such as is the case with the procedures out parameter below.

```
with Option;
package Status is
  type Code is
    (OK,
     Temporary_Failure,
     Exception_Unexpected_Failure);
end Status;

type Data is record
  Humidity : Integer;
end record; 

package Result is new Option
  (Status_Code => Status.Code,
   Item => Data);

procedure Get_Humidity (Sensor_Result : out Result) is
  Readings : Data;
begin
  Readings.Humidity := 50;
  Result :=
    (Output_Available => True,
     Status => Status.OK,
     Output => Readings);
  --  or
  Result :=
    (Output_Available -> False,
     Status => Status.Temporary_Failure);
end Get_Humidity; 

``` 
