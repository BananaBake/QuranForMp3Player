#!/bin/bash

# 1. Create the structured main directory
mkdir -p "Abdul Basit/Pages"
mkdir -p "Abdul Basit/Surahs"

# 2. Download the master ZIP archives from EveryAyah
wget https://everyayah.com/data/Abdul_Basit_Murattal_64kbps/000_versebyverse.zip
wget https://everyayah.com/data/Abdul_Basit_Murattal_64kbps/PageMp3s/000_allfiles.zip

# 3. Extract Page-by-Page flatly
unzip -j 000_allfiles.zip -d "Abdul Basit/Pages/"

# 4. Standardize page file names (Page001.mp3 -> Page_001.mp3)
cd "Abdul Basit/Pages"
for file in Page*.mp3; do
    mv "$file" "${file/Page/Page_}"
done
cd ../..

# 5. Extract Ayah-by-Ayah flatly to a temporary folder for sorting
unzip -j 000_versebyverse.zip -d temp_ayah/
cd temp_ayah

# --- NEW: Save An-Nahl's Bismillah (016000.mp3) to a safe temporary spot ---
cp 016000.mp3 ../bismillah_nahl.mp3

for file in *.mp3; do
    surah="${file:0:3}"
    ayah="${file:3:3}"
    
    case "$surah" in
        001) name="Al-Fatihah" ;;
        002) name="Al-Baqarah" ;;
        003) name="Ali-Imran" ;;
        004) name="An-Nisa" ;;
        005) name="Al-Maidah" ;;
        006) name="Al-Anam" ;;
        007) name="Al-Araf" ;;
        008) name="Al-Anfal" ;;
        009) name="At-Tawbah" ;;
        010) name="Yunus" ;;
        011) name="Hud" ;;
        012) name="Yusuf" ;;
        013) name="Ar-Rad" ;;
        014) name="Ibrahim" ;;
        015) name="Al-Hijr" ;;
        016) name="An-Nahl" ;;
        017) name="Al-Isra" ;;
        018) name="Al-Kahf" ;;
        019) name="Maryam" ;;
        020) name="Ta-Ha" ;;
        021) name="Al-Anbiya" ;;
        022) name="Al-Hajj" ;;
        023) name="Al-Muminun" ;;
        024) name="An-Nur" ;;
        025) name="Al-Furqan" ;;
        026) name="Ash-Shuara" ;;
        027) name="An-Naml" ;;
        028) name="Al-Qasas" ;;
        029) name="Al-Ankabut" ;;
        030) name="Ar-Rum" ;;
        031) name="Luqman" ;;
        032) name="As-Sajdah" ;;
        033) name="Al-Ahzab" ;;
        034) name="Saba" ;;
        035) name="Fatir" ;;
        036) name="Ya-Sin" ;;
        037) name="As-Saffat" ;;
        038) name="Sad" ;;
        039) name="Az-Zumar" ;;
        040) name="Ghafir" ;;
        041) name="Fussilat" ;;
        042) name="Ash-Shura" ;;
        043) name="Az-Zukhruf" ;;
        044) name="Ad-Dukhan" ;;
        045) name="Al-Jathiyah" ;;
        046) name="Al-Ahqaf" ;;
        047) name="Muhammad" ;;
        048) name="Al-Fath" ;;
        049) name="Al-Hujurat" ;;
        050) name="Qaf" ;;
        051) name="Adh-Dhariyat" ;;
        052) name="At-Tur" ;;
        053) name="An-Najm" ;;
        054) name="Al-Qamar" ;;
        055) name="Ar-Rahman" ;;
        056) name="Al-Waqiah" ;;
        057) name="Al-Hadid" ;;
        058) name="Al-Mujadilah" ;;
        059) name="Al-Hashr" ;;
        060) name="Al-Mumtahanah" ;;
        061) name="As-Saff" ;;
        062) name="Al-Jumuah" ;;
        063) name="Al-Munafiqun" ;;
        064) name="At-Taghabun" ;;
        065) name="At-Talaq" ;;
        066) name="At-Tahrim" ;;
        067) name="Al-Mulk" ;;
        068) name="Al-Qalam" ;;
        069) name="Al-Haqqah" ;;
        070) name="Al-Maarij" ;;
        071) name="Nuh" ;;
        072) name="Al-Jinn" ;;
        073) name="Al-Muzzammil" ;;
        074) name="Al-Muddaththir" ;;
        075) name="Al-Qiyamah" ;;
        076) name="Al-Insan" ;;
        077) name="Al-Mursalat" ;;
        078) name="An-Naba" ;;
        079) name="An-Naziat" ;;
        080) name="Abasa" ;;
        081) name="At-Takwir" ;;
        082) name="Al-Infitar" ;;
        083) name="Al-Mutaffifin" ;;
        084) name="Al-Inshiqaq" ;;
        085) name="Al-Buruj" ;;
        086) name="At-Tariq" ;;
        087) name="Al-Ala" ;;
        088) name="Al-Ghashiyah" ;;
        089) name="Al-Fajr" ;;
        090) name="Al-Balad" ;;
        091) name="Ash-Shams" ;;
        092) name="Al-Layl" ;;
        093) name="Ad-Duha" ;;
        094) name="Ash-Sharh" ;;
        095) name="At-Tin" ;;
        096) name="Al-Alaq" ;;
        097) name="Al-Qadr" ;;
        098) name="Al-Bayyinah" ;;
        099) name="Az-Zalzalah" ;;
        100) name="Al-Adiyat" ;;
        101) name="Al-Qariah" ;;
        102) name="At-Takathur" ;;
        103) name="Al-Asr" ;;
        104) name="Al-Humazah" ;;
        105) name="Al-Fil" ;;
        106) name="Quraysh" ;;
        107) name="Al-Maun" ;;
        108) name="Al-Kawthar" ;;
        109) name="Al-Kafirun" ;;
        110) name="An-Nasr" ;;
        111) name="Al-Masad" ;;
        112) name="Al-Ikhlas" ;;
        113) name="Al-Falaq" ;;
        114) name="An-Nas" ;;
    esac

    folder="Surah_${surah} ${name}"
    mkdir -p "$folder"
    mv "$file" "$folder/Ayah_${ayah}.mp3"
done

# --- NEW: Loop through all folders to replace/add the standard Bismillah ---
for folder in Surah_*; do
    # Extract the 3-digit Surah number from the folder title
    surah_num="${folder:6:3}"
    
    # Apply to all surahs EXCEPT Al-Fatihah (001) and At-Tawbah (009)
    if [ "$surah_num" != "001" ] && [ "$surah_num" != "009" ]; then
        # Overwrites if it exists, adds it if it doesn't exist
        cp ../bismillah_nahl.mp3 "$folder/Ayah_000.mp3"
    fi
done

# Move everything into the permanent target directory
mv Surah_* "../Abdul Basit/Surahs/"
cd ..

# 6. Cleanup and final compilation
rm -rf temp_ayah 000_versebyverse.zip 000_allfiles.zip bismillah_nahl.mp3
zip -r AbdulBasit.zip "Abdul Basit"
