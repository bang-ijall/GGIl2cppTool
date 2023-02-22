function gg.searchClass(name, type)
    gg.setRanges(metadata)
    gg.searchNumber(":"..name, type)
    if gg.getResultsCount() == 0 then
        gg.alert("Class name not found")
        os.exit()
    end
    local results = gg.getResults(gg.getResultsCount())
    gg.refineNumber(results[1].value, gg.TYPE_BYTE)
    local results = gg.getResults(gg.getResultsCount())
    gg.addListItems(results)
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.loadResults(gg.getListItems())
    gg.clearList()
    gg.searchPointer(0x0)
    if gg.getResultsCount() == 0 then
        gg.alert("Class not found")
        os.exit()
    end
    local results = gg.getResults(gg.getResultsCount())
    gg.addListItems(results)
    gg.clearResults()
    if gg.getTargetInfo().x64 then
        offset = 0x10
    else
        offset = 0x8
    end
    local copy = false
    local t = gg.getListItems()
    if not copy then
        gg.removeListItems(t)
    end
    for i, v in ipairs(t) do
	    v.address = v.address - offset
	    if copy then
	        v.name = v.name..' #2'
	    end
    end
    gg.addListItems(t)
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.loadResults(gg.getListItems())
    gg.clearList()
    gg.searchPointer(0x0)
    if gg.getResultsCount() == 0 then
        gg.alert("Class not found")
        os.exit()
    end
    local results = gg.getResults(gg.getResultsCount())
    gg.addListItems(results)
end