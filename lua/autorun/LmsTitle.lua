//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=//
//=         LmsTitle          =//
//= Feito Por                 =//
//= Jason(STEAM_0:0:125421770)=//
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=//
if CLIENT then
    surface.CreateFont( "TitleOverHeadFont", {
        font = "Tahoma",
        extended = false, 
        size = 120,
        weight = 500,
        blursize = 0,
        scanlines = 0,  
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        shadow = false,
        additive = false, 
        outline = false,
    })
    surface.CreateFont( "TitleOverHeadFontBlur",{
        font = "Tahoma",
        extended = false, 
        size = 120,
        weight = 500,
        blursize = 14,
        scanlines = 0,
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        shadow = false,
        additive = false, 
        outline = false,
    })  
    local function DrawTitle()
        local CorTitulo = Color(180,180,180)
        for k, ply in pairs(player.GetAll()) do
            local ang = LocalPlayer():EyeAngles()
            local offset = Vector(0,0,19)
            if ply:LookupBone("ValveBiped.Bip01_Head1") != nil then
                
                pos = ply:GetBonePosition(ply:LookupBone("ValveBiped.Bip01_Head1")) + offset
            else 

                pos = ply:GetPos()+ Vector(0,0,70)
            end
            ang:RotateAroundAxis( ang:Forward(), 90 )
            ang:RotateAroundAxis( ang:Right(), 90 )
            cam.Start3D2D( pos,Angle(0,ang.y,90), 0.03 )
                local Titulo  = ply:GetNWString("LmsTitle", "")
                surface.SetFont("NicksOverHeadFont")
                local textw, texth = surface.GetTextSize(Titulo)
                if (ply!=LocalPlayer() or GetConVar("ctp_enabled"):GetInt()==1 or LocalPlayer():InVehicle() and LocalPlayer():GetVehicle():GetCameraDistance()>0) and LocalPlayer():GetPos():Distance(ply:GetPos())<880 then
                    draw.SimpleText(Titulo, "TitleOverHeadFont", 0, 200, CorTitulo, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
                    draw.SimpleText(Titulo, "TitleOverHeadFontBlur", 0, 200, CorTitulo, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
                end
            cam.End3D2D()
        end
    end
    hook.Add("PostDrawOpaqueRenderables","JasonTeste",DrawTitle)
else
    AddCSLuaFile()
    aowl.AddCommand("title|titulo=string[]", function(ply, line)
        if string.len(string.gsub(line,"<.->","")) >= 31 then
            return false, "Titulo muito grande !!!"
        end
        ply:SetNWString("LmsTitle", line)
    end)
end