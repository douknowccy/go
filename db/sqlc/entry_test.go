package db

import (
	"context"
	"testing"

	"github.com/stretchr/testify/require"
)

func createRandomEntry(t *testing.T) Entry {
	arg := CreateEntryParams{
		AccountID: 152,
		Amount:    555,
	}
	entry, err := testQueries.CreateEntry(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, entry)

	return entry
}
func TestCreateEntry(t *testing.T) {
	createRandomEntry(t)
}
