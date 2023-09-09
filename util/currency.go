package util

const (
	USD  = "USD"
	CNY  = "CNY"
	USDT = "USDT"
	PHP  = "PHP"
	TWD  = "TWD"
)

func IsSupportedCUrrency(currency string) bool {
	switch currency {
	case USD, CNY, USDT, PHP, TWD:
		return true
	}
	return false
}
