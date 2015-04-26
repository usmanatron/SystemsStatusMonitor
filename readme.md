## Summary
A set of dashing dashboards, widgets etc. to build a status monitor.
It comprises of two main widgets; one for short-term status and a separate one for long-term messages \ workarounds.

## Running
You need to run the Docker container with a command similar to the one given below.  This dashboard will be available on port 8080:

```
docker run -d -p 8080:3030 -e GEMS=htmlentities -v=/path/to/repo/Dashing.conf/dashboards:/dashboards -v=/path/to/repo/Dashing.conf/jobs:/jobs -v=/path/to/repo/Dashing.conf/widgets:/widgets -v=/path/to/repo/Dashing.conf/config:/config --name="dashing"  frvi/dashing
```