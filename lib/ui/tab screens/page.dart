import 'package:flutter/material.dart';
import 'package:lyrics_ml/ui/song_page.dart';
import 'package:lyrics_ml/utils/song_details.dart';

class RandomPage extends StatelessWidget {
  final SongDetails currentSong = SongDetails(code: 'CPMG',
      language: 'Marwadi',
      likes: 0,
      lyrics:
      'Chowk purao mangal gao\nAaj mere prabhu ghar aavenge...\nAangi rachavo mughat chadavo...(2)\nAaj mere prabhu mann bhaye hai ...(2)\nAaj mere prabhu ghar aavenge...\n\nAeri sakhi mangal gavo reh...\nDharti ambar sajavo reh...\nUtarege aaj mere\nPrabhu ki savari... (2)\nHar koi nacho gaavo re...\nDhol manjira bajavo reh...(2)\nAaj prabhuji mere mann padhare hai...\nAaj jinji mere mann padhare hai…\nKhabar sunavujo khusi reh jatavujo...(2)\nAaj mere prabhu ghar aavenge...\n\nRim jhim badal barase\nKali kali phul khile...(2)\nKhusiya ne aaj mere daale hain dera..(2)\nGannnnanan gant baje...Prabhu naam shank rateh...\nAangan aangan hai khusiyo ka mela...(2)\nAnhad naad bajavo ori sab mil...(2)\nAaj mere prabhu ghar aavenge...\n\nChowk purao mangal gao\nAaj mere prabhu ghar aavenge...\n',
      englishLyrics:
      '(Not Accurate)\nचोख पुरावो, माटी रंगावो,\nआज मेरे प्रभु घर आवेंगे,\n\nखबर सुनाऊ जो, ख़ुशी ये बताओ जो,\nआज मेरे प्रभु घर आवेंगे।।\n\nहेरी सखी मंगल गावो री,\nधरती अम्बर सजाओ री,\nउतरेगी आज मेरे प्रभु की सवारी,\nहेरी कोई काजल लाओ रे,\nमोहे काला टीका लगाओ री,\nउनकी छब से दिखु में तो प्यारी,\nलक्ष्मी जी वारो ,\nनजर उतारो,\nआज मेरे प्रभु घर आवेंगे।।\n\nरंगो से रंग मिले,\nनए नए ढंग खिले,\nख़ुशी आज द्वारे मेरे डाले है डेरा,\nपीहू पीहू पपीहा रटे,\nकुहू कुहू कोयल जपे,\nआँगन आँगन है परियो ने घेरा,\nअनहद नाद बजाओ रे सब-मिल,\nआज मेरे प्रभु घर आवेंगे।।\n\nचोख पुरावो, माटी रंगावो,\nआज मेरे प्रभु घर आवेंगे,\nआज मेरे प्रभु घर आवेंगे।।\n',
      originalSong: 'Piya Ghar Aavenge | Kailash Kher',
      share: 0,
      songNameEnglish: 'Chowk purao (Aaj Mere Prabhu Ghar Aavenge)',
      songNameHindi: 'चोख पुरावो (आज मेरे प्रभु घर आवेंगे)',
      youTubeLink: 'https://youtu.be/jE8J4C3HxQ0');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SongPage(currentSong),
              ),
            );
          },
          child: Text('5th page'),
        ),
      ),
    );
  }
}
