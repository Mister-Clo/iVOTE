<template>
  <div id="pourVoter">
    <div class="title-container">
      <h1 id="nickname">
        Choisissez votre candidat à l'élection présidentielle 2022
      </h1>
    </div>

    <div class="card-container">
      <div v-for="candidat in candidats" :key="candidat.id" class="card">
        <label v-bind:for="candidat.id">
          <div class="img-container">
            <img class="photoId" v-bind:src="candidat.img" alt="photo?" />
          </div>
          <div class="img-container"></div>
          <div class="card-text">
            <h3>{{ candidat.nom }}</h3>
            <br />
            <div class="logoParti-container">
              <img class="logoParti" :src="candidat.logoParti" alt="logo?" />
            </div>
            <br />
            <div class="aperçu-container">
              <p class="aperçu">Voter {{ candidat.nom }}</p>
            </div>
          </div>
        </label>

        <!-- <div class="card-icons">
                        <input
                              type="checkbox"
                              name="choix du vote"
                              v-bind:id="candidat.id"
                              :value="candidat.nom"
                              v-model="vote"/>
                     </div>     -->
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "pourVoter",
  data() {
    return {
      candidats: [
        {
          id: 1,
          nom: "Nathalie Arthaud",
          parti: "Lutte Ouvrière",
          logoParti:
            "https://www.politique-animaux.fr/sites/www.politique-animaux.fr/fichiers/imagecache/100x100-sans-deformation/partis/logos/lo.jpeg",
          img: "https://www.francetvinfo.fr/pictures/CDtZOpLIKBpKzYO0awC56SA3lNM/fit-in/720x/filters:format(webp)/2022/03/04/phps6NxZQ.png",
        },
        {
          id: 2,
          nom: "Philippe Poutou",
          parti: "Nouveau Parti Anticapitaliste",
          logoParti:
            "https://upload.wikimedia.org/wikipedia/fr/0/06/Logo_NPA.png",
          img: "https://www.francetvinfo.fr/pictures/sFbifKq-uz2ncqhHbUrUX5nBIvI/fit-in/720x/filters:format(webp)/2022/03/04/phpoJEWyy.png",
        },
        {
          id: 3,
          nom: "Emmanuel Macron",
          parti: "La république en marche",
          logoParti:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Logo-LREM-noir.svg/2560px-Logo-LREM-noir.svg.png",
          img: "https://www.francetvinfo.fr/pictures/2D4jFxFmfi8lpfPMACH8-av5PLc/fit-in/720x/filters:format(webp)/2022/03/04/php8oceex.png",
        },
        {
          id: 4,
          nom: "Marine Lepen",
          parti: "Rassemblement National",
          logoParti:
            "https://adhesions-rn.fr/img/logotheque/rn-logo-libelle.svg",
          img: "https://www.francetvinfo.fr/pictures/93DhWOH_IdhOIjLFplgx03g46B8/fit-in/720x/filters:format(webp)/2022/03/04/phpNuH3pt.png",
        },
        {
          id: 5,
          nom: "Nicolas Dupont-Aignant",
          parti: "Debout La france",
          logoParti:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Debout_la_France_logo_%282017%29.svg/1200px-Debout_la_France_logo_%282017%29.svg.png",
          img: "https://www.francetvinfo.fr/pictures/fUvLPU9kSvv4yfF6Jc7d73IUrPA/fit-in/720x/filters:format(webp)/2022/03/04/phpkHH57w.png",
        },
        {
          id: 6,
          nom: "Éric Zemmour",
          parti: "Reconquête",
          logoParti: "https://assets.ericzemmour.fr/logo_parti_bleu.svg",
          img: "https://www.francetvinfo.fr/pictures/TCZpzOp5G6BlzqhnEFUw51jNq0g/fit-in/720x/filters:format(webp)/2022/03/07/phptRQLjo.png",
        },
        {
          id: 7,
          nom: "Jean Lassalle",
          parti: "Résistons !",
          logoParti:
            "https://resistons-france.fr/wp-content/uploads/2020/05/Logoresistons.png",
          img: "https://www.francetvinfo.fr/pictures/LUm2lPuAwbJqCV8KCzwDdrbMYU8/fit-in/720x/filters:format(webp)/2022/03/04/phpNzRanM.png",
        },
        {
          id: 8,
          nom: "Valérie Pécresse",
          parti: "Les Républicains",
          logoParti:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/LesR%C3%A9publicains15logo.svg/1200px-LesR%C3%A9publicains15logo.svg.png",
          img: "https://www.francetvinfo.fr/pictures/xUadtpCYIsMItJob0lGbp28lebQ/fit-in/720x/filters:format(webp)/2022/03/04/phptg6Rvf.png",
        },
        {
          id: 9,
          nom: "Anne Hidalgo",
          parti: "Parti Socialiste",
          logoParti:
            "https://upload.wikimedia.org/wikipedia/fr/thumb/f/fd/Ps-france-2016.svg/1200px-Ps-france-2016.svg.png",
          img: "https://www.francetvinfo.fr/pictures/wn2bT0vFHSiANBelsMKRu_PXLA8/fit-in/720x/filters:format(webp)/2022/03/04/phpsPl187.png",
        },
        {
          id: 10,
          nom: "Yannick Jadot",
          parti: "Europe Écologie les Verts",
          logoParti:
            "https://upload.wikimedia.org/wikipedia/fr/thumb/6/69/Logo-e-e-l-v.svg/1200px-Logo-e-e-l-v.svg.png",
          img: "https://www.francetvinfo.fr/pictures/0Jzos4CfZnuYEIWBOXIarP6QwtQ/fit-in/720x/filters:format(webp)/2022/03/04/phpi3QgRt.png",
        },
        {
          id: 11,
          nom: "Jean-Luc Mélenchon",
          parti: "La France Insoumise",
          logoParti:
            "https://lafranceinsoumise.fr/wp-content/uploads/2021/05/cropped-logoFI-2.png",
          img: "https://www.francetvinfo.fr/pictures/dGjOZBtDfCJvq4cFq5hvP7zNXWI/fit-in/720x/filters:format(webp)/2022/03/04/phpiwiRpG.png",
        },
        {
          id: 12,
          nom: "Fabien Roussel",
          parti: "Parti Communiste Français",
          logoParti:
            "https://upload.wikimedia.org/wikipedia/fr/thumb/6/6a/Logo_du_Parti_communiste_fran%C3%A7ais_%282018%2C_rouge%29.svg/1200px-Logo_du_Parti_communiste_fran%C3%A7ais_%282018%2C_rouge%29.svg.png",
          img: "https://www.francetvinfo.fr/pictures/COR2AnPPI-VYe3Pmuj7bat8iIgA/fit-in/720x/filters:format(webp)/2022/03/07/phpFbnk1l.png",
        },
      ],
    };
  },
  searchkey: "",
  vote: [],

  computed: {},
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Ubuntu&display=swap");

#pourVoter {
  font-family: cursive;
  background-repeat: no-repeat;
  background-size: cover;
  overflow: auto;
  display: flex;
  flex-wrap: wrap;
  filter: brightness(1.25);
}
#nickname {
  text-align: center;
}

.title-container {
  width: 100%;
}

h1 {
  padding: 7px;
  margin-top: 5px;
  color: rgb(4, 5, 36);
}

h3 {
  font-size: 1.2rem;
  padding-right: 4px;
  height: 20px;
}

.img-container {
  grid-area: a;
  display: flex;
  align-items: center;
}
.photoId {
  width: 100%;
  height: 100%;
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}

.logoParti {
  height: 55px;
  width: 120px;
  margin-bottom: 5px;
}
.logoParti-container {
  margin-top: 25px;
}

.card-container {
  display: flex;
  flex-wrap: wrap;
  margin: auto;
  justify-content: space-around;
  width: 1050px;
  overflow: hidden;
}

.card {
  margin: 0.4rem 1rem 0.4rem 0;
  background: rgb(208, 243, 246);
  border-radius: 10px;
  position: relative;
  box-shadow: 0 0px 6px rgba(51, 51, 51, 0.15);
  transition: 0.5s ease;
  width: 200px;
  cursor: pointer;
  display: inline-block;
  box-shadow: 0 0px 6px rgba(51, 51, 51, 0.15);
  border-right: 2px solid #000;
  border-left: 2px solid #000;
  border-top: 2px solid #000;
  border-bottom: 2px solid #000;
}

label {
  padding: 0;
  margin: 0;
}
.card:hover .aperçu {
  display: block;
}

.aperçu-container {
  margin-top: 10px;
  margin-bottom: 6px;
}

.aperçu {
  position: fixed;
  display: none;
  bottom: -10px;
  left: 30px;
  color: whitesmoke;
  font-weight: bold;
  align-content: center;
  width: 140px;
  opacity: 90%;
}
.card:hover {
  transform: scale(1.06);
  color: rgba(251, 38, 38, 0.5);
  filter: brightness(1.3);
  background-color: red;
}

.card-text {
  opacity: 1;
  bottom: 2.3rem;
  font-size: small;
  font-weight: bold;
  padding: 3px 4px;
  color: rgb(16, 15, 74);
  border-top-right-radius: 0px;
  border-top-left-radius: 0px;
  border-bottom-left-radius: 9px;
  background: linear-gradient(500deg, lightblue 20%, transparent 100%);
}
.card-icons {
  display: flex;
  align-items: center;
  justify-content: space-around;
  height: 40px;
}

label {
  cursor: pointer;
}
</style>
