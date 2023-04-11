# Hardware Overview

So... a story about hardware.  I have a PC I built in 2014 (I think?) that has been my "gaming system" for 8 years now.  
It still works just fine, but... I also had to replace an older (2017?) Thinkpad X1 Carbon and figured I could possibly get a machine to pretty much "do it all".  The Dell XPS 9520 15" with NVIDIA GeForce RTX 3050 Ti Graphics Card.   What I now have is a machine that does not really do anything all that well.  Battery is abysmal, it gets pretty hot doing anything remotely demanding, desktop hangs for no apparent reason, serious lag/delays while using Windows.  So, I live with the deficiency (and this will be the last Dell laptop I ever buy probably - it's not the worst, but... I should have just stuck with Lenovo, a brand which I have had and loved for 2 almost decades now.)


| Hostname | Manufacturer | Model       | Processor Model                        | Cores / Threads | Memory |
|:---------|:-------------|:------------|:---------------------------------------|:--------:|:----:|
| slippy   | Dell Inc.    | XPS 15 9520 |  12th Gen Intel(R) Core(TM) i9-12900HK |  14 / 20 | 31Gi |

[12th Gen Intel(R) Core(TM) i9-12900HK - Specifications](https://www.intel.com/content/www/us/en/products/sku/132215/intel-core-i912900hk-processor-24m-cache-up-to-5-00-ghz/specifications.html)

```
echo "| `hostname -s` | `dmidecode -s system-manufacturer` | `dmidecode -s system-product-name` | `grep ^model\ name /proc/cpuinfo | uniq | awk -F: '{ print $2 }'` | `grep cpu\ cores /proc/cpuinfo | awk -F\: '{ print $2 }' | uniq` / `grep cpu\ cores /proc/cpuinfo 2>/dev/null |wc -l` | `free -h | grep "Mem:" | awk '{ print $2 }'` |"
```

### Geekbench 5

As you can see this system is no slouch

| Name | Platform | Architecture | Single-core Score | Multi-core Score | 
|:---------------------------------------------------------------------|:-----:|:-------:|:----:|:-----:|
| Dell Inc. XPS 15 9520 <BR> Intel Core i9-12900HK 4900 MHz (14 cores) | Linux | x64     | 1815 | 11246 | 
| MacBook Pro (13-inch Late 2020) <BR> Apple M1 3197 MHz (8 cores)     | macOS | AArch64 | 1759 | 7676  |
