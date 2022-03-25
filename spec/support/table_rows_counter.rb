def expected_rows(rows)
  expect(page).to have_xpath('.//tr', count: rows + 1)
end