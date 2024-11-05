# option_type
A Generic Option Result Type (Mutant discriminated record)

This works by the fact that an unconstrained variant record can be replaced by setting all record components using an aggregate. An unconstrained variant record is one with a default value (in option.ads)


```options.ads
type Output (Output_Available : Boolean := False) is record
```

*AND* not initialised such as is the case with the procedures out parameter below.

```usage.ads
with Options;
package Status is
  type Code is
    (OK,
     Temporary_Failure,
     Exception_Unexpected_Failure);
end Status;

type Data is record
  Humidity : Integer;
end record; 

package Option is new Options
  (Item => Data);

procedure Get_Humidity
 (Sensor_Result : out Status.Code;
  Sensor_Output : out Option.Output)
is
  Readings : Data;
begin
  Readings.Humidity := 50;
  Sensor_Output :=
    (Output_Available => True,
     Output => Readings);
  Sensor_Result := Status.OK;

  --  or
  Sensor_Output :=
    (Output_Available -> False);
  Sensor_Result := Status.Temporary_Failure;

  --  or
  Sensor_Result := Status.Temporary_Failure;

  --  or you can also replace it multiple times if it makes sense to
  --  so long as the entire record is set (below) or replaced by a
  --  record copy (not shown)
  Sensor_Output :=
    (Output_Available -> False);
  Sensor_Result := Status.Temporary_Failure;
  --  ... attempt some recovery stuff
  Sensor_Output :=
    (Output_Available => True,
     Output => Readings);
  Sensor_Result := Status.OK;

end Get_Humidity;

``` 
