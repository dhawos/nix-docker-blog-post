package components_test

import (
	"strings"
	"testing"

	"example-app/components"
)

func TestHello(t *testing.T) {
	var b strings.Builder
	component := components.Hello("toto")
	err := component.Render(t.Context(), &b)
	if err != nil {
		t.Fatal()
	}
	if b.String() != "<div>Hello, toto</div>" {
		t.Fatal()
	}
}
