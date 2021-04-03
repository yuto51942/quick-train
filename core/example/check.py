import torch


def check():
  """
  Check can it be used pytorch.
  """
  print(torch.__version__)
  print(torch.cuda.is_available())

def main():
  check()


if __name__ == "__main__":
  main()
