json.comment do
    json.id @comment.id
    json.content @comment.content
    json.user_id @comment.user_id
    json.project_id @comment.project_id
    json.created_at @comment.created_at
end


