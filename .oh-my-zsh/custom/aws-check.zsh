aws_check() {
    if aws ssm get-parameter --name "/core/platform/db/atlas_core_connection_string" &> /dev/null; then
        echo "✅ AWS credentials are valid"
        return 0
    else
        echo "❌ AWS credentials expired - running aws sso login..."
        aws sso login
        return $?
    fi
}
alias awsc='aws_check'
