import gql from 'graphql-tag';

// tasksテーブルのnameカラムを取得するクエリを定義
export const getCard = gql `
  {
    tasks{
      id
      content
    }
  }
`;
