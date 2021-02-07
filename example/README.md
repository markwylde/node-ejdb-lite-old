# EJDB2 JavaScript example project

```ts
const { EJDB2 } = require('node-ejdb-lite');

async function run () {
  const db = await EJDB2.open('example.db', { truncate: true });

  const id1 = await db.put('parrots', { name: 'Bianca', age: 4 });
  console.log(`Bianca record: ${id1}`);

  const id2 = await db.put('parrots', { name: 'Darko', age: 8 });
  console.log(`Darko record: ${id2}`);

  const q = db.createQuery('/[age > :age]', 'parrots');

  for await (const doc of q.setNumber('age', 3).stream()) {
    console.log(`Found ${doc}`);
  }

  await db.close();
}

run();
```

## Build and run

```sh
cd ./example
npm install
npm run start
```
