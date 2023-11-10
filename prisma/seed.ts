import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

/* Seed Jurisdiction */
const dummyJurisdiction = async () => {
    const jurisdictions = [
        {
            name: 'China',
            code: 'CN',
        },
        {
            name: 'USA',
            code: 'US',
        },
        {
            name: 'Canada',
            code: 'CA',
        },
        {
            name: 'Japan',
            code: 'JP',
        },
        {
            name: 'German',
            code: 'DE',
        },
        {
            name: 'France',
            code: 'FR',
        },
        {
            name: 'PCT',
            code: 'WO',
        },
        {
            name: 'UK',
            code: 'GB',
        },
        {
            name: 'UAE',
            code: 'UE',
        },
        {
            name: 'Korea',
            code: 'KR',
        },
        {
            name: 'Hong Kong',
            code: 'HK',
        },
        {
            name: 'Singapore',
            code: 'SG',
        },
        {
            name: 'Italy',
            code: 'IT',
        },
        {
            name: 'Spain',
            code: 'ES',
        },
        {
            name: 'Australia',
            code: 'AU',
        },
        {
            name: 'New Zealand',
            code: 'NZ',
        },
        {
            name: 'THailand',
            code: 'TH',
        },
        {
            name: 'Vietnam',
            code: 'VT',
        },
        {
            name: 'Philippines',
            code: 'PH',
        },
    ];

    const existingJurisdiction = await prisma.jurisdiction.findMany({
        where: {
            code: {
                in: jurisdictions.map((item) => item.code),
            },
        },
    });

    if (existingJurisdiction && existingJurisdiction.length > 0) {
        return;
    }

    await prisma.jurisdiction.createMany({
        data: jurisdictions,
    });
};

/* Seed Class */
const dummyClass = async () => {
    const classes = [
        {
            name: 'CLASS 1',
            code: '01',
            description:
                'Chemicals used in industry, science and photography, as well as in agriculture, horticulture and forestry; unprocessed artificial resins, unprocessed plastics; manures; fire extinguishing compositions; tempering and soldering preparations; chemical substances for preserving foodstuffs; tanning substances; adhesives used in industry.',
        },
        {
            name: 'CLASS 2',
            code: '02',
            description:
                'Paints, varnishes, lacquers; preservatives against rust and against deterioration of wood; colorants; mordants; raw natural resins; metals in foil and powder form for use in painting, decorating, printing and art.',
        },
        {
            name: 'CLASS 3',
            code: '03',
            description:
                'Bleaching preparations and other substances for laundry use; cleaning, polishing, scouring and abrasive preparations; non-medicated soaps; perfumery, essential oils, non-medicated cosmetics, non-medicated hair lotions; non-medicated dentifrices.',
        },
        {
            name: 'CLASS 4',
            code: '04',
            description:
                'Industrial oils and greases; lubricants; dust absorbing, wetting and binding compositions; fuels (including motor spirit) and illuminants; candles and wicks for lighting.',
        },
        {
            name: 'CLASS 5',
            code: '05',
            description:
                'Pharmaceuticals, medical and veterinary preparations; sanitary preparations for medical purposes; dietetic food and substances adapted for medical or veterinary use, food for babies; dietary supplements for humans and animals; plasters, materials for dressings; material for stopping teeth, dental wax; disinfectants; preparations for destroying vermin; fungicides, herbicides.',
        },
        {
            name: 'CLASS 6',
            code: '06',
            description:
                'Common metals and their alloys, ores; metal materials for building and construction; transportable buildings of metal; non-electric cables and wires of common metal; small items of metal hardware; metal containers for storage or transport; safes.',
        },
        {
            name: 'CLASS 7',
            code: '07',
            description:
                'Machines and machine tools; motors and engines (except for land vehicles); machine coupling and transmission components (except for land vehicles); agricultural implements other than hand-operated; incubators for eggs; automatic vending machines.',
        },
        {
            name: 'CLASS 8',
            code: '08',
            description: 'Hand tools and implements (hand-operated); cutlery; side arms; razors.',
        },
        {
            name: 'CLASS 9',
            code: '09',
            description:
                'Scientific, nautical, surveying, photographic, cinematographic, optical, weighing, measuring, signalling, checking (supervision), life-saving and teaching apparatus and instruments; apparatus and instruments for conducting, switching, transforming, accumulating, regulating or controlling electricity; apparatus for recording, transmission or reproduction of sound or images; magnetic data carriers, recording discs; compact discs, DVDs and other digital recording media; mechanisms for coin-operated apparatus; cash registers, calculating machines, data processing equipment, computers; computer software; fire-extinguishing apparatus.',
        },
        {
            name: 'CLASS 10',
            code: '10',
            description:
                'Surgical, medical, dental and veterinary apparatus and instruments; artificial limbs, eyes and teeth; orthopaedic articles; suture materials; therapeutic and assistive devices adapted for the disabled; massage apparatus; apparatus, devices and articles for nursing infants; sexual activity apparatus, devices and articles.',
        },
        {
            name: 'CLASS 11',
            code: '11',
            description:
                'Apparatus for lighting, heating, steam generating, cooking, refrigerating, drying, ventilating, water supply and sanitary purposes.',
        },
        {
            name: 'CLASS 12',
            code: '12',
            description: 'Vehicles; apparatus for locomotion by land, air or water.',
        },
        {
            name: 'CLASS 13',
            code: '13',
            description: 'Firearms; ammunition and projectiles; explosives; fireworks.',
        },
        {
            name: 'CLASS 14',
            code: '14',
            description: 'Precious metals and their alloys; jewellery, precious and semi-precious stones; horological and chronometric instruments.',
        },
        {
            name: 'CLASS 15',
            code: '15',
            description: 'Musical instruments.',
        },
        {
            name: 'CLASS 16',
            code: '16',
            description:
                'Paper and cardboard; printed matter; bookbinding material; photographs; stationery and office requisites, except furniture; adhesives for stationery or household purposes; artists',
        },
        {
            name: 'CLASS 17',
            code: '17',
            description:
                'Unprocessed and semi-processed rubber, gutta-percha, gum, asbestos, mica and substitutes for all these materials; plastics and resins in extruded form for use in manufacture; packing, stopping and insulating materials; flexible pipes, tubes and hoses, not of metal.',
        },
        {
            name: 'CLASS 18',
            code: '18',
            description:
                'Leather and imitations of leather; animal skins and hides; luggage and carrying bags; umbrellas and parasols; walking sticks; whips, harness and saddlery; collars, leashes and clothing for animals.',
        },
        {
            name: 'CLASS 19',
            code: '19',
            description:
                'Building materials (non-metallic); non-metallic rigid pipes for building; asphalt, pitch and bitumen; non-metallic transportable buildings; monuments, not of metal.',
        },
        {
            name: 'CLASS 20',
            code: '20',
            description:
                'Furniture, mirrors, picture frames; containers, not of metal, for storage or transport; unworked or semi-worked bone, horn, whalebone or mother-of-pearl; shells; meerschaum; yellow amber.',
        },
        {
            name: 'CLASS 21',
            code: '21',
            description:
                'Household or kitchen utensils and containers; combs and sponges; brushes, except paintbrushes; brush-making materials; articles for cleaning purposes; unworked or semi-worked glass, except building glass; glassware, porcelain and earthenware.',
        },
        {
            name: 'CLASS 22',
            code: '22',
            description:
                'Ropes and string; nets; tents and tarpaulins; awnings of textile or synthetic materials; sails; sacks for the transport and storage of materials in bulk; padding, cushioning and stuffing materials, except of paper, cardboard, rubber or plastics; raw fibrous textile materials and substitutes therefor.',
        },
        {
            name: 'CLASS 23',
            code: '23',
            description: 'Yarns and threads, for textile use.',
        },
        {
            name: 'CLASS 24',
            code: '24',
            description: 'Textiles and substitutes for textiles; household linen; curtains of textile or plastic.',
        },
        {
            name: 'CLASS 25',
            code: '25',
            description: 'Clothing, footwear, headgear.',
        },
        {
            name: 'CLASS 26',
            code: '26',
            description:
                'Lace and embroidery, ribbons and braid; buttons, hooks and eyes, pins and needles; artificial flowers; hair decorations; false hair.',
        },
        {
            name: 'CLASS 27',
            code: '27',
            description: 'Carpets, rugs, mats and matting, linoleum and other materials for covering existing floors; wall hangings (non-textile).',
        },
        {
            name: 'CLASS 28',
            code: '28',
            description: 'Games, toys and playthings; video game apparatus; gymnastic and sporting articles; decorations for Christmas trees.',
        },
        {
            name: 'CLASS 29',
            code: '29',
            description:
                'Meat, fish, poultry and game; meat extracts; preserved, frozen, dried and cooked fruits and vegetables; jellies, jams, compotes; eggs; milk and milk products; edible oils and fats.',
        },
        {
            name: 'CLASS 30',
            code: '30',
            description:
                'Coffee, tea, cocoa and artificial coffee; rice; tapioca and sago; flour and preparations made from cereals; bread, pastries and confectionery; edible ices; sugar, honey, treacle; yeast, baking-powder; salt; mustard; vinegar, sauces (condiments); spices; ice.',
        },
        {
            name: 'CLASS 31',
            code: '31',
            description:
                'Raw and unprocessed agricultural, aquacultural, horticultural and forestry products; raw and unprocessed grains and seeds; fresh fruits and vegetables, fresh herbs; natural plants and flowers; bulbs, seedlings and seeds for planting; live animals; foodstuffs and beverages for animals; malt.',
        },
        {
            name: 'CLASS 32',
            code: '32',
            description:
                'Beers; mineral and aerated waters and other non-alcoholic beverages; fruit beverages and fruit juices; syrups and other preparations for making beverages.',
        },
        {
            name: 'CLASS 33',
            code: '33',
            description: 'Alcoholic beverages (except beers).',
        },
        {
            name: 'CLASS 34',
            code: '34',
            description: 'Tobacco; smokers',
        },
        {
            name: 'CLASS 35',
            code: '35',
            description: 'Advertising; business management; business administration; office functions.',
        },
        {
            name: 'CLASS 36',
            code: '36',
            description: 'Insurance; financial affairs; monetary affairs; real estate affairs.',
        },
        {
            name: 'CLASS 37',
            code: '37',
            description: 'Building construction; repair; installation services.',
        },
        {
            name: 'CLASS 38',
            code: '38',
            description: 'Telecommunications.',
        },
        {
            name: 'CLASS 39',
            code: '39',
            description: 'Transport; packaging and storage of goods; travel arrangement.',
        },
        {
            name: 'CLASS 40',
            code: '40',
            description: 'Treatment of materials.',
        },
        {
            name: 'CLASS 41',
            code: '41',
            description: 'Education; Training; Forum; Seminar; Sporting and Cultural Activities; Entertainment; etc.',
        },
        {
            name: 'CLASS 42',
            code: '42',
            description:
                'Scientific and technological services and research and design relating thereto; industrial analysis and research services; design and development of computer hardware and software.',
        },
        {
            name: 'CLASS 43',
            code: '43',
            description: 'Services for providing food and drink; temporary accommodation.',
        },
        {
            name: 'CLASS 44',
            code: '44',
            description:
                'Medical services; veterinary services; hygienic and beauty care for human beings or animals; agriculture, horticulture and forestry services.',
        },
        {
            name: 'CLASS 45',
            code: '45',
            description:
                'Online social networking services; legal services; security services for the physical protection of tangible property and individuals; personal and social services rendered by others to meet the needs of individuals.',
        },
        {
            name: 'BUD',
            code: '50',
            description: 'BUD FUND',
        },
        {
            name: 'PAG',
            code: '51',
            description: 'PAG - PATENT APPLICATION GRANT',
        },
        {
            name: 'TVP',
            code: '52',
            description: 'TECHNOLOGY VOUCHER PROGRAMME',
        },
        {
            name: 'EMF',
            code: '53',
            description: 'SME EXPORT MARKETING FUND',
        },
    ];

    const existingClass = await prisma.class.findMany({
        where: {
            code: {
                in: classes.map((item) => item.code),
            },
        },
    });

    if (existingClass && existingClass.length > 0) {
        return;
    }

    await prisma.class.createMany({
        data: classes,
    });
};

/* Seed Job */
const dummyJob = async () => {
    const jobs = [
        {
            name: 'Filing',
            code: 'FL',
        },
        {
            name: 'Office Action',
            code: 'OA',
        },
        {
            name: 'Application Grant',
            code: 'GN',
        },
        {
            name: 'Project due-diligence',
            code: 'DD',
        },
        {
            name: 'Project reimbursement',
            code: 'PR',
        },
        {
            name: 'Renewal',
            code: 'RN',
        },
        {
            name: 'Opposition',
            code: 'OP',
        },
        {
            name: 'Cancellation',
            code: 'CN',
        },
        {
            name: 'Drafting',
            code: 'DT',
        },
        {
            name: 'Translation',
            code: 'TR',
        },
        {
            name: 'Search',
            code: 'SR',
        },
        {
            name: 'FTO',
            code: 'FT',
        },
        {
            name: 'Patent Analysis',
            code: 'AN',
        },
        {
            name: 'Infringement Analysis',
            code: 'IF',
        },
        {
            name: 'Invalidation',
            code: 'IV',
        },
        {
            name: 'Customs recordal',
            code: 'CR',
        },
        {
            name: 'CoSec.',
            code: 'CS',
        },
        {
            name: 'SOU',
            code: 'SO',
        },
    ];

    const existingJobs = await prisma.job.findMany({
        where: {
            code: {
                in: jobs.map((item) => item.code),
            },
        },
    });

    if (existingJobs && existingJobs.length > 0) {
        return;
    }

    await prisma.job.createMany({
        data: jobs,
    });
};

/* Seed Work */
const dummyWork = async () => {
    const work = [
        {
            name: 'Trademark',
            code: 'T',
            fields: [],
        },
        {
            name: 'Patent',
            code: 'P',
            fields: [],
        },
        {
            name: 'Design Patent',
            code: 'D',
            fields: [],
        },
        {
            name: 'Copyright',
            code: 'C',
            fields: [],
        },
        {
            name: 'Funding',
            code: 'F',
            fields: [],
        },
    ];

    const existingWork = await prisma.work.findMany({
        where: {
            code: {
                in: work.map((item) => item.code),
            },
        },
    });

    if (existingWork && existingWork.length > 0) {
        return;
    }

    await prisma.work.createMany({
        data: work,
    });
};

/* Seed Client */
const dummyClient = async () => {
    const clients = [
        {
            contactPerson: 'Ronaldo',
            companyName: 'CR7 Ltd',
        },
        {
            contactPerson: 'Messi',
            companyName: 'Messi Ltd',
        },
    ];

    const existingClient = await prisma.client.findMany({
        where: {
            companyName: {
                in: clients.map((item) => item.companyName),
            },
            contactPerson: {
                in: clients.map((item) => item.contactPerson),
            },
        },
    });

    if (existingClient) {
        return;
    }

    await prisma.client.createMany({
        data: clients,
    });
};

async function main() {
    /* Comment out if you don't want to run the seed */
    //await dummyClient();
    await dummyJurisdiction();
    await dummyClass();
    await dummyJob();
    await dummyWork();
}

/* MAIN FUNC */
/*
 * Run pnpx prisma db seed to seed
 */
main()
    .then(async () => {
        await prisma.$disconnect();
    })
    .catch(async (e) => {
        console.error(e);
        await prisma.$disconnect();
        process.exit(1);
    });
