function gg.setHook(name, offset1, offset2, value, type)
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP) 
    gg.searchNumber("0", gg.TYPE_DWORD)
    if count == 0 then
        os.exit()
    end
    isLog = gg.getResults(1)
    gg.clearResults()
    for i, v in ipairs(gg.getRangesList(name)) do
        if v.type:sub(3, 3) == "x" or v.state == "Xa" then
            isLibil2cpp = v.start
            isOK = true
            break
        end
    end
    if not isOK then
        os.exit()
    end
    isEdit = value
    if type == gg.TYPE_FLOAT or type == 16 then
        gg.getResults(gg.getResultsCount())
        gg.clearResults()
        gg.loadResults(isLog)
        gg.getResults(gg.getResultsCount())
        local results = gg.getResults(gg.getResultsCount())
        for i, v in ipairs(results) do
            results[i].address = results[i].address + 0x0
            results[i].flags = gg.TYPE_FLOAT
        end
        gg.loadResults(results)
        gg.getResults(gg.getResultsCount())
        gg.getResults(gg.getResultsCount())
        gg.editAll(isEdit, gg.TYPE_FLOAT)
        gg.getResults(gg.getResultsCount())
        local results = gg.getResults(gg.getResultsCount())
        for i, v in ipairs(results) do
            results[i].address = results[i].address + 0x0
            results[i].flags = gg.TYPE_WORD
        end
        gg.loadResults(results)
        gg.getResults(gg.getResultsCount())
        isEdit = 0
        gg.getResults(gg.getResultsCount())
        local results = gg.getResults(gg.getResultsCount())
        gg.getResults(gg.getResultsCount())
        gg.editAll(isEdit, gg.TYPE_WORD)
        gg.getResults(gg.getResultsCount())
        local results = gg.getResults(gg.getResultsCount())
        for i, v in ipairs(results) do
            results[i].address = results[i].address + 0x2
            results[i].flags = gg.TYPE_WORD
        end
        gg.loadResults(results)
        gg.getResults(gg.getResultsCount())
        isArm = gg.getResults(1)
        if tonumber(isArm[1].value) < 0 then
            os.exit()
        end
        gg.getResults(gg.getResultsCount())
        local results = gg.getResults(gg.getResultsCount())
        for i, v in ipairs(results) do
            results[i].address = results[i].address - 0x2
            results[i].flags = gg.TYPE_FLOAT
        end
        gg.loadResults(results)
        gg.getResults(gg.getResultsCount())
        isArm = gg.getResults(1)
        isEdit = isArm[1].value
        gg.getResults(gg.getResultsCount())
        gg.editAll(isEdit, gg.TYPE_FLOAT)
        gg.getResults(gg.getResultsCount())
        local results = gg.getResults(gg.getResultsCount())
        for i, v in ipairs(results) do
            results[i].address = results[i].address + 0x2
            results[i].flags = gg.TYPE_WORD
        end
        gg.loadResults(results)
        gg.getResults(gg.getResultsCount())
        isEdit = gg.getResults(1)
        if tonumber(isEdit[1].value) < 0 then
            os.exit()
        end
        gg.clearResults()
        gg.getResults(gg.getResultsCount())
        gg.clearResults()
        isEdit = isEdit[1].value  
        gg.loadResults(gg.getListItems())
        gg.clearList()
        gg.getResults(2)
    elseif type == gg.TYPE_BYTE or type == 1 then
        if isEdit == true then
            isEdit = "1"
        elseif isEdit == false then
            isEdit = "0"
        end
    elseif type == gg.TYPE_DWORD or type == 4 then
    else
        os.exit()
    end
    isAddress1 = {
        {
            address = isLibil2cpp + offset2
        }
    }
    isAddress2 = {
        {
            address = isLibil2cpp + offset2 + 0x4
        }
    }
    isAddress3 = {
        {
            address = isLibil2cpp + offset2 + 0x8
        }
    }
    isValueUpdate1 = gg.getValues({
        {
            address = isAddress1[1].address,
            flags = gg.TYPE_QWORD
        }
    })
    isValueUpdate2 = gg.getValues({
        {
            address = isAddress2[1].address,
            flags = gg.TYPE_DWORD
        }
    })
    isValueUpdate3 = gg.getValues({
        {
            address = isAddress1[1].address,
            flags = gg.TYPE_DWORD
        }
    })
    if isValueUpdate3[1].value ~= "-450891772" then
        isAllocate = gg.allocatePage(gg.PROT_EXEC | gg.PROT_WRITE | gg.PROT_READ, 0x0)
        isAllocate1 = gg.getValues({
            {
                address = isAllocate,
                flags = gg.TYPE_DWORD
            }
        })
        isAllocate2 = gg.getValues({
            {
                address = isAllocate + 0x4,
                flags = gg.TYPE_DWORD
            }
        })
        isAllocate3 = gg.getValues({
            {
                address = isAllocate + 0x8,
                flags = gg.TYPE_DWORD
            }
        })
        isAllocate4 = gg.getValues({
            {
                address = isAllocate + 0xC,
                flags = gg.TYPE_DWORD
            }
        })
        isAllocate5 = gg.getValues({
            {
                address = isAllocate + 0x10,
                flags = gg.TYPE_DWORD
            }
        })
        isAllocate6 = gg.getValues({
            {
                address = isAllocate + 0x14,
                flags = gg.TYPE_DWORD
            }
        })
        isAllocate7 = gg.getValues({
            {
                address = isAllocate + 0x18,
                flags = gg.TYPE_DWORD
            }
        })
        isAllocate8 = gg.getValues({
            {
                address = isAllocate + 0x1C,
                flags = gg.TYPE_DWORD
            }
        })
        local isHexLib = string.format("%X", isAddress3[1].address)
        local isHexAllocate = string.format("%X", isAllocate1[1].address)
        gg.setValues({
            {
                address = isAllocate1[1].address,
                flags = gg.TYPE_QWORD,
                value = isValueUpdate1[1].value
            }
        })
        gg.setValues({
            {
                address = isAllocate3[1].address,
                flags = gg.TYPE_DWORD,
                value = "~A CMP R0, #0"
            }
        })
        gg.setValues({
            {
                address = isAllocate4[1].address,
                flags = gg.TYPE_DWORD,
                value = "~A BEQ +0xC"
            }
        })
        if type == gg.TYPE_DWORD or type == 4 or type == gg.TYPE_BYTE or type == 1 then
            gg.setValues({
                {
                    address = isAllocate5[1].address,
                    flags = gg.TYPE_DWORD,
                    value = "~A MOV R1, #"..isEdit
                }
            })
        elseif type == gg.TYPE_FLOAT or type == 16 then
            gg.setValues({
                {
                    address = isAllocate5[1].address,
                    flags = gg.TYPE_DWORD,
                    value = "~A MOVT R1, #"..isEdit
                }
            })
        end
        gg.setValues({
            {
                address = isAllocate6[1].address,
                flags = gg.TYPE_DWORD,
                value = "~A STR R1, [R0,#"..offset1.."]"
            }
        })
        gg.setValues({
            {
                address = isAllocate7[1].address,
                flags = gg.TYPE_DWORD,
                value = "~A LDR PC, [PC,#-4]"
            }
        })
        gg.setValues({
            {
                address = isAllocate8[1].address,
                flags = gg.TYPE_DWORD,
                value = isHexLib.."h"
            }
        })
        gg.setValues({
            {
                address = isValueUpdate1[1].address,
                flags = gg.TYPE_DWORD,
                value = "~A LDR PC, [PC,#-4]"
            }
        })
        gg.setValues({
            {
                address = isValueUpdate2[1].address,
                flags = gg.TYPE_DWORD,
                value = isHexAllocate.."h"
            }
        })
    else
        isUpdate = gg.getValues(isValueUpdate2)
        local isHexUpdate = string.format("%X", isUpdate[1].address)
        isUpdate[1].address  = isValueUpdate2[1].value + 0x10
        isUpdate[1].flags = gg.TYPE_DWORD
        isUpdate = gg.getValues(isUpdate)
        gg.addListItems(isUpdate)
        gg.loadResults(gg.getListItems())
        gg.clearList()
        gg.getResults(1)
        if type == gg.TYPE_DWORD or type == 4 or type == gg.TYPE_BYTE or type == 1 then
            gg.editAll("~A MOV R1, #"..isEdit, gg.TYPE_DWORD)
        elseif type == gg.TYPE_FLOAT or type == 16 then
            gg.editAll("~A MOVT R1, #"..isEdit, gg.TYPE_DWORD)
        end
        gg.clearResults()
    end
end