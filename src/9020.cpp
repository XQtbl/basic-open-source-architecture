#include <array>
#include <iostream>
#include <algorithm>
#include <cstdint>
#include <cmath>

static constexpr size_t max_idx = 10000;

static consteval auto generate_is_prime() {
  std::array<bool, max_idx + 1> ret;
  std::ranges::fill(ret, true);

  for (size_t i = 2; i * i <= max_idx; i++) {
    if (!ret[i])
      continue;

    for (size_t j = i * i; j <= max_idx; j += i) {
      ret[j] = false;
    }
  }

  return ret;
}


static consteval auto generate_answer() {
  constexpr std::array<bool, max_idx + 1> is_prime = generate_is_prime();

  std::array<int, max_idx + 1> ret{};

  for (size_t i = 2; i <= max_idx; i++) {
    for (size_t j = i; j <= max_idx; j++) {
      if (i+j > max_idx)
        break;
      if ((i+j) & 1) // is odd
        continue;

      if (is_prime[i] && is_prime[j] && i+j - 2*ret[i+j] > j - i)
        ret[i+j] = i;
    }
  }

  return ret;
}

class Problem {
public:
  Problem() = default;

  void solve() const {
    uint16_t target;
    std::cin >> target;

    std::cout << answer_[target] << ' ' << target - answer_[target] << '\n';
  }

  static constexpr auto answer_ = generate_answer();
};


int main() {
  uint16_t test_cnt;
  std::cin >> test_cnt;

  constexpr Problem p{};
  for (uint16_t i = 0; i < test_cnt; i++) {
    p.solve();
  }
}