function gg.editField(value, offset, type)
    items = gg.getListItems()
    for i, v in ipairs(items) do
        v.address = v.address + offset
        v.flags = type
    end
    gg.clearResults()
    gg.loadResults(items)
    count = gg.getResultsCount()
    if count == 0 then
        os.exit()
    end
    gg.getResults(count)
    gg.editAll(value, type)
    gg.clearResults()
end