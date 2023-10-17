import typing

T = typing.TypeVar("T")
U = typing.TypeVar("U")


class Option(typing.Generic[T]):
    def __init__(self, value: typing.Optional[T] = None) -> None:
        self.value = value

    def __repr__(self) -> str:
        if self.value is not None:
            return f"Some({self.value})"
        else:
            return "None"

    def __eq__(self, other: typing.Any) -> bool:
        if isinstance(other, Option):
            return self.value == other.value
        else:
            return False

    def __ne__(self, other: typing.Any) -> bool:
        return not self.__eq__(other)

    def map(self, f: typing.Callable[[T], U]) -> "Option[U]":
        if self.value is not None:
            return Option(f(self.value))
        else:
            return Option()

    def flat_map(self, f: typing.Callable[[T], "Option[U]"]) -> "Option[U]":
        if self.value is not None:
            return f(self.value)
        else:
            return Option()

    def get_or_else(self, default: T) -> T:
        if self.value is not None:
            return self.value
        else:
            return default

    def or_else(self, default: "Option[T]") -> "Option[T]":
        if self.value is not None:
            return self
        else:
            return default

    def to_list(self) -> typing.List[T]:
        if self.value is not None:
            return [self.value]
        else:
            return []

    def filter(self, predicate: typing.Callable[[T], bool]) -> "Option[T]":
        if self.value is not None and predicate(self.value):
            return self
        else:
            return Option()

    def filter_not(self, predicate: typing.Callable[[T], bool]) -> "Option[T]":
        if self.value is not None and not predicate(self.value):
            return self
        else:
            return Option()

    def exists(self, predicate: typing.Callable[[T], bool]) -> bool:
        if self.value is not None:
            return predicate(self.value)
        else:
            return False

    def forall(self, predicate: typing.Callable[[T], bool]) -> bool:
        if self.value is not None:
            return predicate(self.value)
        else:
            return True

    def to_either(self, error: U) -> "Either[T, U]":
        if self.value is not None:
            return Either(self.value)
        else:
            return Either(error=error)


class Either(typing.Generic[T, U]):
    def __init__(
        self, value: typing.Optional[T] = None, error: typing.Optional[U] = None
    ) -> None:
        self.value = value
        self.error = error

    def __repr__(self) -> str:
        if self.value is not None:
            return f"Right({self.value})"
        else:
            return f"Left({self.error})"

    def __eq__(self, other: typing.Any) -> bool:
        if isinstance(other, Either):
            return self.value == other.value and self.error == other.error
        else:
            return False

    def __ne__(self, other: typing.Any) -> bool:
        return not self.__eq__(other)

    def map(self, f: typing.Callable[[T], U]) -> "Either[U, typing.Any]":
        if self.value is not None:
            return Either(f(self.value))
        else:
            return Either(error=self.error)

    def flat_map(
        self, f: typing.Callable[[T], "Either[U, typing.Any]"]
    ) -> "Either[U, typing.Any]":
        if self.value is not None:
            return f(self.value)
        else:
            return Either(error=self.error)

    def get_or_else(self, default: T) -> T:
        if self.value is not None:
            return self.value
        else:
            return default

    def or_else(self, default: "Either[T, U]") -> "Either[T, U]":
        if self.value is not None:
            return self
        else:
            return default

    def to_list(self) -> typing.List[T]:
        if self.value is not None:
            return [self.value]
        else:
            return []

    def filter(self, predicate: typing.Callable[[T], bool]) -> "Either[T, U]":
        if self.value is not None and predicate(self.value):
            return self
        else:
            return Either(error=self.error)

    def filter_not(self, predicate: typing.Callable[[T], bool]) -> "Either[T, U]":
        if self.value is not None and not predicate(self.value):
            return self
        else:
            return Either(error=self.error)

    def exists(self, predicate: typing.Callable[[T], bool]) -> bool:
        if self.value is not None:
            return predicate(self.value)
        else:
            return False

    def forall(self, predicate: typing.Callable[[T], bool]) -> bool:
        if self.value is not None:
            return predicate(self.value)
        else:
            return True

    def to_option(self) -> "Option[T]":
        if self.value is not None:
            return Option(self.value)
        else:
            return Option()


Op = typing.Union[typing.Literal["+"], typing.Literal["*"]]
Expr = typing.Union[int, typing.Tuple[Op, "Expr", "Expr"]]


def eval_expr(expr: Expr) -> int:
    if isinstance(expr, int):
        return expr
    else:
        op, lhs, rhs = expr
        if op == "+":
            return eval_expr(lhs) + eval_expr(rhs)
        elif op == "*":
            return eval_expr(lhs) * eval_expr(rhs)
        else:
            raise ValueError(f"Unknown operator: {op}")

if __name__ == "__main__":
    expr = ("*", ("+", 1, 2), 3)
    print(eval_expr(expr))
