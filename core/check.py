import torch


def check():
  """
  Check can it be used pytorch.
  """
  print(torch.__version__)
  print(torch.cuda.is_available())
