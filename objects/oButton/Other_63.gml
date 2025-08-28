var i_d = ds_map_find_value(async_load, "id")
if (i_d == messageID)
{
	if (ds_map_find_value(async_load, "status"))
	{
		if (ds_map_find_value(async_load, "result") != "")
		{
			switch (prompttype) {
				case prompt_type.name:
					global.username = ds_map_find_value(async_load, "result")
					break;
			
				case prompt_type.ip:
					global.ip = ds_map_find_value(async_load, "result")
					break;
			
				case prompt_type.port:
					global.port = int64(ds_map_find_value(async_load, "result"))
					break;
			}
			
		}
	}
}